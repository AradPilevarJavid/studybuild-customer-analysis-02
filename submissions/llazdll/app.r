# ============================================================================
# RFM Customer Segmentation — Enhanced Shiny Dashboard  (v2 · Polished UI/UX)
# R port of: rfm_analysis.py  (StudyBuild Project 02 - Customer Analysis)
# ----------------------------------------------------------------------------
# Run with:
#     shiny::runApp("app.R")
# or open this file in RStudio and click "Run App".
#
# On first run, any missing packages listed below are installed automatically.
# You can upload your own cleaned_dataset.xlsx / .csv from the sidebar.
#
# WHAT'S NEW IN THIS VERSION
#   - Modern "glass card" visual language: soft shadows, rounded corners,
#     gradient navbar/hero, consistent spacing scale
#   - Light/Dark mode toggle (bslib::input_dark_mode) that also re-themes plots
#   - Custom Google Fonts (Inter for body, Poppins for headings)
#   - Animated KPI value boxes with icon chips + subtle hover lift
#   - Loading spinners (shinycssloaders) on every chart/table so switching
#     filters never feels like a blank flash
#   - Segment "chips" with matching colors used consistently across app
#   - Business Insights tab redesigned as ranked cards with revenue-share
#     progress bars instead of plain text
#   - Sticky, collapsible sidebar with icon-labelled filter groups + a
#     "reset filters" action + live filtered-row counter
#   - Empty-state / error-state cards instead of raw validate() text
#   - Table styling upgraded (rounded pills for segment, right-aligned $s)
# ============================================================================

required_packages <- c(
  "shiny", "bslib", "plotly", "DT", "dplyr", "tidyr",
  "readxl", "openxlsx", "scales", "shinycssloaders", "shinyWidgets", "htmltools"
)
missing_packages <- setdiff(required_packages, rownames(installed.packages()))
if (length(missing_packages) > 0) install.packages(missing_packages)
invisible(lapply(required_packages, library, character.only = TRUE))

# ============================================================================
# Design tokens
# ============================================================================

BRAND_PRIMARY   <- "#4F46E5"   # indigo
BRAND_SECONDARY <- "#06B6D4"   # cyan
BRAND_SUCCESS   <- "#10B981"
BRAND_WARNING   <- "#F59E0B"
BRAND_DANGER    <- "#EF4444"
BRAND_INFO      <- "#0EA5E9"

REQUIRED_COLUMNS <- c(
  "customer_id", "first_name", "gender", "age", "city", "province",
  "signup_date", "membership_tier", "purchase_count", "avg_order_value",
  "total_spending", "last_purchase_days", "payment_method", "device",
  "discount_used", "returned_items", "satisfaction_score"
)

SEGMENT_COLORS <- c(
  "Champions"           = "#4F46E5",
  "Loyal Customers"     = "#06B6D4",
  "Potential Loyalists" = "#8B5CF6",
  "New Customers"       = "#14B8A6",
  "Promising"           = "#F59E0B",
  "At Risk"             = "#EF4444",
  "Need Attention"      = "#EAB308",
  "Hibernating"         = "#94A3B8",
  "Lost"                = "#64748B"
)

SEGMENT_ICONS <- c(
  "Champions"           = "crown",
  "Loyal Customers"     = "heart",
  "Potential Loyalists" = "seedling",
  "New Customers"       = "star",
  "Promising"           = "arrow-trend-up",
  "At Risk"             = "triangle-exclamation",
  "Need Attention"      = "bell",
  "Hibernating"         = "moon",
  "Lost"                = "ghost"
)

SEGMENT_ACTIONS <- list(
  "Champions"           = "VIP treatment, exclusive early access, referral incentives.",
  "Loyal Customers"     = "Loyalty rewards, upsell premium tiers, ask for reviews.",
  "Potential Loyalists" = "Loyalty-program enrollment, cross-sell, increase purchase frequency.",
  "New Customers"       = "Onboarding series, second-purchase incentives, product education.",
  "Promising"           = "Targeted promotions to build habit and raise order value.",
  "At Risk"             = "Win-back campaigns, personalized outreach, limited-time discounts.",
  "Need Attention"      = "Re-engagement emails, satisfaction check-ins, tailored offers.",
  "Hibernating"         = "Reactivation campaigns, remind them of value, steep incentive to return.",
  "Lost"                = "Low-cost reactivation attempts; deprioritize versus other segments."
)

VIRIDIS_LIKE <- c("#440154", "#3B528B", "#21908D", "#5DC863", "#FDE725")

# ---- Read the default dataset from /data/cleaned_dataset.xlsx ----
load_default_data <- function() {
  default_file <- file.path("data", "cleaned_dataset.xlsx")
  if (file.exists(default_file)) {
    return(read_uploaded_data(default_file, basename(default_file)))
  } else {
    message("Default dataset not found. You can upload your own file.")
    return(NULL)
  }
}

# ---- Read an uploaded .xlsx / .csv into a data.frame -----------------------
read_uploaded_data <- function(path, name) {
  ext <- tolower(tools::file_ext(name))
  if (ext %in% c("xlsx", "xls")) {
    as.data.frame(readxl::read_excel(path))
  } else if (ext == "csv") {
    utils::read.csv(path, stringsAsFactors = FALSE)
  } else {
    stop("Unsupported file type — please upload a .xlsx or .csv file.")
  }
}

# ---- Core RFM calculation + segmentation (mirrors rfm_analysis.py) --------
compute_rfm <- function(df) {
  missing_cols <- setdiff(REQUIRED_COLUMNS, names(df))
  if (length(missing_cols) > 0) {
    stop(paste0("Missing required column(s): ", paste(missing_cols, collapse = ", ")))
  }

  df <- df %>%
    mutate(
      age                 = suppressWarnings(as.numeric(age)),
      purchase_count      = suppressWarnings(as.numeric(purchase_count)),
      avg_order_value     = suppressWarnings(as.numeric(avg_order_value)),
      total_spending      = suppressWarnings(as.numeric(total_spending)),
      last_purchase_days  = suppressWarnings(as.numeric(last_purchase_days)),
      satisfaction_score  = suppressWarnings(as.numeric(satisfaction_score)),
      across(c(first_name, gender, city, province, membership_tier,
               payment_method, device, discount_used),
             ~ trimws(as.character(.x)))
    ) %>%
    filter(!is.na(total_spending), !is.na(purchase_count), !is.na(last_purchase_days))

  if (nrow(df) == 0) stop("No usable rows after cleaning Recency / Frequency / Monetary columns.")

  df %>%
    transmute(
      customer_id, first_name,
      Monetary  = total_spending,
      Frequency = purchase_count,
      Recency   = last_purchase_days,
      membership_tier, satisfaction_score, age, gender, city, province,
      device, payment_method
    ) %>%
    mutate(
      R_Score  = 6L - as.integer(ntile(Recency, 5)),
      F_Score  = as.integer(ntile(Frequency, 5)),
      M_Score  = as.integer(ntile(Monetary, 5)),
      RFM_Score    = R_Score + F_Score + M_Score,
      RFM_Category = paste0(R_Score, F_Score, M_Score),
      Segment = case_when(
        R_Score >= 4 & F_Score >= 4 & M_Score >= 4 ~ "Champions",
        R_Score >= 3 & F_Score >= 4 & M_Score >= 4 ~ "Loyal Customers",
        R_Score >= 4 & F_Score <= 2 & M_Score >= 3 ~ "Potential Loyalists",
        R_Score >= 4 & F_Score <= 2 & M_Score <= 2 ~ "New Customers",
        R_Score >= 3 & F_Score >= 3 & M_Score <= 2 ~ "Promising",
        R_Score <= 2 & F_Score >= 3 & M_Score >= 3 ~ "At Risk",
        R_Score <= 2 & F_Score >= 2 & M_Score >= 2 ~ "Need Attention",
        R_Score <= 2 & F_Score <= 2 & M_Score >= 3 ~ "Hibernating",
        TRUE ~ "Lost"
      )
    )
}

# ---- small UI helper: a colored segment "chip" -----------------------------
segment_chip <- function(seg) {
  span(
    icon(SEGMENT_ICONS[[seg]] %||% "circle", class = "me-1"),
    seg,
    class = "segment-chip",
    style = sprintf(
      "background:%s1A; color:%s; border:1px solid %s40;",
      SEGMENT_COLORS[[seg]], SEGMENT_COLORS[[seg]], SEGMENT_COLORS[[seg]]
    )
  )
}

`%||%` <- function(a, b) if (is.null(a) || length(a) == 0 || is.na(a)) b else a

# ---- empty / error state card ----------------------------------------------
empty_state <- function(msg, icon_name = "inbox") {
  div(
    class = "empty-state",
    icon(icon_name, class = "empty-state-icon"),
    p(msg)
  )
}

# ============================================================================
# UI
# ============================================================================

app_theme <- bs_theme(
  version = 5,
  base_font    = font_google("Inter"),
  heading_font = font_google("Poppins", wght = "600"),
  primary      = BRAND_PRIMARY,
  secondary    = BRAND_SECONDARY,
  success      = BRAND_SUCCESS,
  warning      = BRAND_WARNING,
  danger       = BRAND_DANGER,
  info         = BRAND_INFO,
  "body-bg"           = "#F5F6FB",
  "border-radius"      = "0.9rem",
  "border-radius-lg"   = "1.1rem",
  "font-size-base"     = "0.95rem",
  "navbar-bg"          = BRAND_PRIMARY
) %>%
  bs_add_rules("
    :root{
      --brand-grad: linear-gradient(135deg, #4F46E5 0%, #06B6D4 100%);
    }
    body { background: #F5F6FB; }
    .navbar { background: var(--brand-grad) !important; box-shadow: 0 2px 12px rgba(79,70,229,.25); }
    .navbar-brand { font-family: 'Poppins', sans-serif; font-weight: 700; letter-spacing: .2px; }
    .card {
      border: none;
      border-radius: 1.1rem;
      box-shadow: 0 1px 2px rgba(15,23,42,.04), 0 6px 20px rgba(15,23,42,.06);
      transition: box-shadow .18s ease, transform .18s ease;
    }
    .card:hover { box-shadow: 0 4px 8px rgba(15,23,42,.06), 0 12px 28px rgba(15,23,42,.10); }
    .card-header {
      background: transparent;
      border-bottom: 1px solid rgba(15,23,42,.06);
      font-family: 'Poppins', sans-serif;
      font-weight: 600;
      font-size: .95rem;
      padding: .9rem 1.15rem;
    }
    .card-body { padding: 1.1rem 1.15rem; }

    /* ---- sidebar ---- */
    .bslib-sidebar-layout > .sidebar {
      background: #FFFFFF;
      border-right: 1px solid rgba(15,23,42,.06) !important;
    }
    .sidebar-title { font-family:'Poppins',sans-serif; font-weight:700; color:#1E1B4B; }
    .filter-group-label {
      font-size: .78rem; text-transform: uppercase; letter-spacing: .06em;
      color: #6B7280; font-weight: 700; margin: 1rem 0 .35rem 0;
      display:flex; align-items:center; gap:.4rem;
    }

    /* ---- KPI value boxes ---- */
    .kpi-box {
      border-radius: 1.1rem; padding: 1.1rem 1.2rem; color: #fff; position:relative;
      overflow:hidden; box-shadow: 0 6px 18px rgba(15,23,42,.10);
      transition: transform .18s ease;
    }
    .kpi-box:hover { transform: translateY(-3px); }
    .kpi-box .kpi-icon {
      position:absolute; right:.9rem; top:.9rem; font-size:1.6rem; opacity:.35;
    }
    .kpi-box .kpi-label { font-size:.78rem; text-transform:uppercase; letter-spacing:.06em; opacity:.9; }
    .kpi-box .kpi-value { font-family:'Poppins',sans-serif; font-size:1.65rem; font-weight:700; margin-top:.15rem; }

    /* ---- segment chips ---- */
    .segment-chip {
      display:inline-flex; align-items:center; padding:.28rem .65rem; border-radius:999px;
      font-size:.8rem; font-weight:600;
    }

    /* ---- insight cards ---- */
    .segment-card .card-header { color:#fff !important; border-bottom:none; }
    .progress-track {
      background:rgba(15,23,42,.06); border-radius:999px; height:8px; overflow:hidden; margin-top:.5rem;
    }
    .progress-fill { height:100%; border-radius:999px; }

    /* ---- empty state ---- */
    .empty-state { text-align:center; padding:2.5rem 1rem; color:#94A3B8; }
    .empty-state-icon { font-size:2.2rem; margin-bottom:.6rem; display:block; }

    /* ---- misc ---- */
    hr { border-color: rgba(15,23,42,.08); }
    .badge-soft {
      background:rgba(79,70,229,.1); color:#4F46E5; border-radius:999px; padding:.25rem .6rem;
      font-size:.75rem; font-weight:700;
    }
    ::-webkit-scrollbar { width:8px; height:8px; }
    ::-webkit-scrollbar-thumb { background:#C7D2FE; border-radius:8px; }

    [data-bs-theme='dark'] body { background:#0F172A; }
    [data-bs-theme='dark'] .card { background:#1E293B; }
    [data-bs-theme='dark'] .bslib-sidebar-layout > .sidebar { background:#111827; }
    [data-bs-theme='dark'] .filter-group-label { color:#9CA3AF; }
  ")

ui <- page_navbar(
  title = tagList(
    icon("chart-pie", class = "me-2"),
    "RFM Customer Segmentation"
  ),
  theme = app_theme,
  underline = TRUE,
  fillable = TRUE,
  navbar_options = navbar_options(bg = BRAND_PRIMARY, class = "shadow-sm"),

  nav_spacer(),
  nav_item(input_dark_mode(id = "dark_mode", mode = "light")),

  sidebar = sidebar(
    width = 320,
    class = "border-end",
    open = "desktop",
    div(class = "sidebar-title mb-1", icon("sliders", class = "me-2"),"Data & Filters"),
    p(class = "text-muted small mb-3", "Upload your data, then slice the dashboard below."),

    div(class = "filter-group-label", icon("file-arrow-up"), "Dataset"),
    fileInput("data_file", NULL,
              accept = c(".xlsx", ".xls", ".csv"),
              buttonLabel = "Browse...",
              placeholder = "No file selected"),
    tags$details(
      tags$summary(class = "small text-muted", "Expected columns"),
      tags$small(paste(REQUIRED_COLUMNS, collapse = ", "), class = "text-muted")
    ),

    uiOutput("filter_ui"),

    hr(),
    uiOutput("filter_summary"),
    br(),
    downloadButton("download_results", "Download full results (.xlsx)",
                   class = "btn btn-primary w-100 shadow-sm"),
    br(), br(),
    div(class = "text-muted small text-center",
        icon("circle-info"), " Tip: click a bar in the Overview chart to drill in.")
  ),

  nav_panel(
    "Overview",
    icon = icon("gauge-high"),
    uiOutput("error_banner"),
    uiOutput("vb_row"),
    br(),
    layout_columns(
      col_widths = c(6, 6),
      card(
        full_screen = TRUE,
        card_header(icon("layer-group", class = "me-2"), "Customers by Segment",
                    span(class = "float-end small text-muted", "click a bar to filter \u2193")),
        card_body(withSpinner(plotlyOutput("plot_segment_dist", height = "380px"),
                              color = BRAND_PRIMARY, type = 6))
      ),
      card(
        full_screen = TRUE,
        card_header(icon("sack-dollar", class = "me-2"), "Total Revenue by Segment"),
        card_body(withSpinner(plotlyOutput("plot_revenue_by_segment", height = "380px"),
                              color = BRAND_PRIMARY, type = 6))
      )
    )
  ),

  nav_panel(
    "RFM Explorer",
    icon = icon("magnifying-glass-chart"),
    br(),
    layout_columns(
      col_widths = c(6, 6),
      card(
        full_screen = TRUE,
        card_header(icon("chart-column", class = "me-2"), "RFM Combined Score Distribution (3\u201315)"),
        card_body(withSpinner(plotlyOutput("plot_rfm_hist", height = "360px"),
                              color = BRAND_PRIMARY, type = 6))
      ),
      card(
        full_screen = TRUE,
        card_header(icon("table-cells", class = "me-2"), "Average R / F / M Scores by Segment"),
        card_body(withSpinner(plotlyOutput("plot_heatmap", height = "360px"),
                              color = BRAND_PRIMARY, type = 6))
      )
    ),
    br(),
    card(
      full_screen = TRUE,
      card_header(icon("braille", class = "me-2"), "Recency vs Frequency (color = Monetary Value)"),
      card_body(withSpinner(plotlyOutput("plot_scatter", height = "480px"),
                            color = BRAND_PRIMARY, type = 6))
    )
  ),

  nav_panel(
    "Segment Details",
    icon = icon("users-gear"),
    br(),
    card(
      full_screen = TRUE,
      card_header(icon("face-smile", class = "me-2"), "Average Satisfaction Score by Segment"),
      card_body(withSpinner(plotlyOutput("plot_satisfaction", height = "340px"),
                            color = BRAND_PRIMARY, type = 6))
    ),
    br(),
    card(
      full_screen = TRUE,
      card_header(icon("table", class = "me-2"), "Customer-Level RFM Table"),
      card_body(withSpinner(DTOutput("rfm_table"), color = BRAND_PRIMARY, type = 6))
    )
  ),

  nav_panel(
    "Business Insights",
    icon = icon("lightbulb"),
    br(),
    div(class = "mb-3",
        h5(class = "mb-1", "Recommended action per segment"),
        p(class = "text-muted", "Ranked by revenue contribution \u2014 reflects all customers, independent of sidebar filters.")
    ),
    uiOutput("insights_cards")
  ),

  nav_item(tags$a(icon("circle-question"), class = "nav-link", title = "RFM = Recency, Frequency, Monetary"))
)

# ============================================================================
# Server
# ============================================================================

server <- function(input, output, session) {
  app_state <- reactiveValues(error = NULL)
  raw_data  <- reactiveVal(load_default_data())

  # theme that follows the light/dark toggle, used for plot backgrounds/fonts
  plot_theme <- reactive({
    dark <- identical(input$dark_mode, "dark")
    list(
      paper = "rgba(0,0,0,0)",
      plot  = "rgba(0,0,0,0)",
      font  = list(color = if (dark) "#E5E7EB" else "#1F2937", family = "Inter, sans-serif"),
      grid  = if (dark) "rgba(255,255,255,.08)" else "rgba(15,23,42,.06)"
    )
  })

  observeEvent(input$data_file, {
    req(input$data_file)
    tryCatch({
      df <- read_uploaded_data(input$data_file$datapath, input$data_file$name)
      raw_data(df)
      showNotification(tagList(icon("circle-check"), " File loaded successfully."),
                       type = "message")
    }, error = function(e) {
      showNotification(paste("Could not read file:", e$message), type = "error", duration = 8)
    })
  })

  rfm_data <- reactive({
    req(raw_data())
    tryCatch({
      res <- compute_rfm(raw_data())
      app_state$error <- NULL
      res
    }, error = function(e) {
      app_state$error <- e$message
      NULL
    })
  })

  output$error_banner <- renderUI({
    if (!is.null(app_state$error)) {
      div(class = "alert alert-danger d-flex align-items-center gap-2 shadow-sm",
          icon("triangle-exclamation"), app_state$error)
    }
  })

  # -------------------- dynamic sidebar filters -----------------------------
  output$filter_ui <- renderUI({
    rd <- rfm_data()
    req(rd)
    tagList(
      div(class = "filter-group-label", icon("layer-group"), "Segment"),
      selectizeInput("f_segment", NULL,
                     choices = sort(unique(rd$Segment)),
                     selected = sort(unique(rd$Segment)), multiple = TRUE),

      div(class = "filter-group-label", icon("id-badge"), "Membership tier"),
      selectizeInput("f_tier", NULL,
                     choices = sort(unique(rd$membership_tier)),
                     selected = sort(unique(rd$membership_tier)), multiple = TRUE),

      div(class = "filter-group-label", icon("venus-mars"), "Gender"),
      selectizeInput("f_gender", NULL,
                     choices = sort(unique(rd$gender)),
                     selected = sort(unique(rd$gender)), multiple = TRUE),

      div(class = "filter-group-label", icon("face-smile"), "Satisfaction score"),
      sliderInput("f_satisfaction", NULL,
                  min = floor(min(rd$satisfaction_score, na.rm = TRUE)),
                  max = ceiling(max(rd$satisfaction_score, na.rm = TRUE)),
                  value = c(floor(min(rd$satisfaction_score, na.rm = TRUE)),
                            ceiling(max(rd$satisfaction_score, na.rm = TRUE))),
                  step = 0.5),

      if (!is.null(clicked_segment())) {
        div(class = "mt-2",
            actionButton("clear_click_filter",
                         label = tagList(icon("xmark"), paste0(" Clear chart selection (", clicked_segment(), ")")),
                         class = "btn btn-sm btn-outline-secondary w-100"))
      },
      actionLink("reset_filters", tagList(icon("rotate-left"), " Reset all filters"),
                 class = "small text-muted d-block mt-3")
    )
  })

  observeEvent(input$reset_filters, {
    rd <- rfm_data(); req(rd)
    updateSelectizeInput(session, "f_segment", selected = sort(unique(rd$Segment)))
    updateSelectizeInput(session, "f_tier", selected = sort(unique(rd$membership_tier)))
    updateSelectizeInput(session, "f_gender", selected = sort(unique(rd$gender)))
    updateSliderInput(session, "f_satisfaction",
                      value = c(floor(min(rd$satisfaction_score, na.rm = TRUE)),
                                ceiling(max(rd$satisfaction_score, na.rm = TRUE))))
    clicked_segment(NULL)
  })

  # -------------------- click-to-filter (Overview bar chart) ---------------
  clicked_segment <- reactiveVal(NULL)

  observeEvent(event_data("plotly_click", source = "segDist"), {
    ev <- event_data("plotly_click", source = "segDist")
    req(ev)
    clicked_segment(ev$y)
  })

  observeEvent(input$clear_click_filter, { clicked_segment(NULL) })

  filtered_data <- reactive({
    rd <- rfm_data()
    req(rd)
    req(input$f_segment, input$f_tier, input$f_gender, input$f_satisfaction)

    d <- rd %>%
      filter(
        Segment %in% input$f_segment,
        membership_tier %in% input$f_tier,
        gender %in% input$f_gender,
        satisfaction_score >= input$f_satisfaction[1],
        satisfaction_score <= input$f_satisfaction[2]
      )

    if (!is.null(clicked_segment())) {
      d <- d %>% filter(Segment == clicked_segment())
    }
    d
  })

  output$filter_summary <- renderUI({
    rd <- rfm_data(); req(rd)
    d <- tryCatch(filtered_data(), error = function(e) NULL)
    n_shown <- if (is.null(d)) 0 else nrow(d)
    n_total <- nrow(rd)
    div(class = "small text-muted",
        icon("filter"), sprintf(" Showing %s of %s customers",
                                scales::comma(n_shown), scales::comma(n_total)))
  })

  # -------------------- KPI value boxes -------------------------------------
  kpi_box <- function(label, value, icon_name, gradient) {
    div(class = "kpi-box", style = sprintf("background:%s;", gradient),
        icon(icon_name, class = "kpi-icon"),
        div(class = "kpi-label", label),
        div(class = "kpi-value", value)
    )
  }

  output$vb_row <- renderUI({
    d <- filtered_data()
    if (is.null(d) || nrow(d) == 0) return(empty_state("No customers match the current filters.", "filter-circle-xmark"))

    layout_columns(
      col_widths = c(12, 12, 12, 12, 12) |> (\(x) rep(x[1] <- 12/5, 5))(),
      kpi_box("Customers", scales::comma(nrow(d)), "users",
              "linear-gradient(135deg,#4F46E5,#6366F1)"),
      kpi_box("Total Revenue", scales::dollar(sum(d$Monetary, na.rm = TRUE)), "sack-dollar",
              "linear-gradient(135deg,#059669,#10B981)"),
      kpi_box("Avg RFM Score", round(mean(d$RFM_Score, na.rm = TRUE), 1), "gauge-high",
              "linear-gradient(135deg,#0891B2,#06B6D4)"),
      kpi_box("Champions", scales::comma(sum(d$Segment == "Champions")), "crown",
              "linear-gradient(135deg,#D97706,#F59E0B)"),
      kpi_box("At Risk", scales::comma(sum(d$Segment == "At Risk")), "triangle-exclamation",
              "linear-gradient(135deg,#DC2626,#EF4444)")
    )
  })

  # -------------------- Overview plots --------------------------------------
  output$plot_segment_dist <- renderPlotly({
    d <- filtered_data(); req(d)
    if (nrow(d) == 0) return(plotly_empty(type = "scatter", mode = "markers"))
    pt <- plot_theme()
    seg <- d %>% count(Segment, name = "Count") %>% arrange(Count)
    seg$Segment <- factor(seg$Segment, levels = seg$Segment)

    plot_ly(seg, x = ~Count, y = ~Segment, type = "bar", orientation = "h",
            source = "segDist",
            marker = list(color = unname(SEGMENT_COLORS[as.character(seg$Segment)]),
                          line = list(width = 0)),
            text = ~Count, textposition = "outside",
            hovertemplate = "%{y}: %{x} customers<extra></extra>") %>%
      layout(xaxis = list(title = "Number of Customers", gridcolor = pt$grid, zeroline = FALSE),
             yaxis = list(title = "", gridcolor = pt$grid),
             margin = list(l = 150), font = pt$font, bargap = 0.35,
             plot_bgcolor = pt$plot, paper_bgcolor = pt$paper) %>%
      config(displayModeBar = FALSE)
  })

  output$plot_revenue_by_segment <- renderPlotly({
    d <- filtered_data(); req(d)
    if (nrow(d) == 0) return(plotly_empty(type = "scatter", mode = "markers"))
    pt <- plot_theme()
    rev <- d %>% group_by(Segment) %>% summarise(Revenue = sum(Monetary), .groups = "drop") %>%
      arrange(Revenue)
    rev$Segment <- factor(rev$Segment, levels = rev$Segment)

    plot_ly(rev, x = ~Revenue, y = ~Segment, type = "bar", orientation = "h",
            marker = list(color = unname(SEGMENT_COLORS[as.character(rev$Segment)]),
                          line = list(width = 0)),
            text = ~scales::dollar(Revenue), textposition = "outside",
            hovertemplate = "%{y}: %{x:$,.0f}<extra></extra>") %>%
      layout(xaxis = list(title = "Revenue", gridcolor = pt$grid, zeroline = FALSE),
             yaxis = list(title = "", gridcolor = pt$grid),
             margin = list(l = 150), font = pt$font, bargap = 0.35,
             plot_bgcolor = pt$plot, paper_bgcolor = pt$paper) %>%
      config(displayModeBar = FALSE)
  })

  # -------------------- RFM Explorer plots -----------------------------------
  output$plot_rfm_hist <- renderPlotly({
    d <- filtered_data(); req(d)
    if (nrow(d) == 0) return(plotly_empty(type = "scatter", mode = "markers"))
    pt <- plot_theme()
    plot_ly(d, x = ~RFM_Score, type = "histogram",
            marker = list(color = BRAND_PRIMARY, line = list(color = "white", width = 1))) %>%
      layout(xaxis = list(title = "RFM Score", gridcolor = pt$grid),
             yaxis = list(title = "Count", gridcolor = pt$grid),
             font = pt$font, bargap = 0.05,
             plot_bgcolor = pt$plot, paper_bgcolor = pt$paper) %>%
      config(displayModeBar = FALSE)
  })

  output$plot_heatmap <- renderPlotly({
    d <- filtered_data(); req(d)
    if (nrow(d) == 0) return(plotly_empty(type = "scatter", mode = "markers"))
    pt <- plot_theme()
    hm <- d %>% group_by(Segment) %>%
      summarise(R = mean(R_Score), F = mean(F_Score), M = mean(M_Score), .groups = "drop")
    z <- t(as.matrix(hm[, c("R", "F", "M")]))

    plot_ly(x = hm$Segment, y = c("R_Score", "F_Score", "M_Score"), z = z,
            type = "heatmap",
            colors = grDevices::colorRamp(c("#EF4444", "#F59E0B", "#FDE68A", "#86EFAC", "#4F46E5")),
            text = round(z, 1), texttemplate = "%{text}", showscale = TRUE) %>%
      layout(xaxis = list(title = "", gridcolor = pt$grid),
             yaxis = list(title = "", gridcolor = pt$grid),
             font = pt$font,
             plot_bgcolor = pt$plot, paper_bgcolor = pt$paper) %>%
      config(displayModeBar = FALSE)
  })

  output$plot_scatter <- renderPlotly({
    d <- filtered_data(); req(d)
    if (nrow(d) == 0) return(plotly_empty(type = "scatter", mode = "markers"))
    pt <- plot_theme()
    plot_ly(d, x = ~Recency, y = ~Frequency, color = ~Monetary,
            colors = VIRIDIS_LIKE, type = "scatter", mode = "markers",
            text = ~paste0("Customer: ", customer_id,
                           "<br>Segment: ", Segment,
                           "<br>Monetary: ", scales::dollar(Monetary)),
            hoverinfo = "text",
            marker = list(size = 9, opacity = 0.78, line = list(color = "white", width = 0.5))) %>%
      layout(xaxis = list(title = "Recency (days since last purchase)", gridcolor = pt$grid),
             yaxis = list(title = "Frequency (purchase count)", gridcolor = pt$grid),
             font = pt$font,
             plot_bgcolor = pt$plot, paper_bgcolor = pt$paper) %>%
      config(displayModeBar = FALSE)
  })

  # -------------------- Segment Details --------------------------------------
  output$plot_satisfaction <- renderPlotly({
    d <- filtered_data(); req(d)
    if (nrow(d) == 0) return(plotly_empty(type = "scatter", mode = "markers"))
    pt <- plot_theme()
    sat <- d %>% group_by(Segment) %>%
      summarise(Avg_Satisfaction = mean(satisfaction_score, na.rm = TRUE), .groups = "drop") %>%
      arrange(Avg_Satisfaction)
    sat$Segment <- factor(sat$Segment, levels = sat$Segment)

    plot_ly(sat, x = ~Avg_Satisfaction, y = ~Segment, type = "bar", orientation = "h",
            marker = list(color = unname(SEGMENT_COLORS[as.character(sat$Segment)]),
                          line = list(width = 0)),
            text = ~round(Avg_Satisfaction, 2), textposition = "outside",
            hovertemplate = "%{y}: %{x:.2f}<extra></extra>") %>%
      layout(xaxis = list(title = "Average Satisfaction Score", range = c(0, 5.5), gridcolor = pt$grid),
             yaxis = list(title = "", gridcolor = pt$grid),
             margin = list(l = 150), font = pt$font, bargap = 0.35,
             plot_bgcolor = pt$plot, paper_bgcolor = pt$paper) %>%
      config(displayModeBar = FALSE)
  })

  output$rfm_table <- renderDT({
    d <- filtered_data(); req(d)
    tbl <- d %>%
      select(customer_id, first_name, Segment, Recency, Frequency, Monetary,
             R_Score, F_Score, M_Score, RFM_Score, membership_tier,
             satisfaction_score, gender, city, province, device, payment_method) %>%
      arrange(desc(Monetary))

    datatable(tbl, filter = "top", rownames = FALSE,
              class = "table table-hover",
              options = list(
                pageLength = 15, scrollX = TRUE,
                dom = "lftip",
                columnDefs = list(list(className = "dt-center", targets = c(6, 7, 8, 9)))
              )) %>%
      formatCurrency("Monetary", currency = "$") %>%
      formatStyle("Segment",
                  backgroundColor = styleEqual(names(SEGMENT_COLORS), unname(SEGMENT_COLORS)),
                  color = "white", fontWeight = "bold",
                  borderRadius = "999px") %>%
      formatStyle("RFM_Score", fontWeight = "bold", color = BRAND_PRIMARY)
  })

  # -------------------- Business Insights -------------------------------------
  output$insights_cards <- renderUI({
    d <- rfm_data(); req(d)
    seg_stats <- d %>%
      group_by(Segment) %>%
      summarise(Customers = n(), Revenue = sum(Monetary), .groups = "drop") %>%
      mutate(Share = round(Revenue / sum(Revenue) * 100, 1)) %>%
      arrange(desc(Revenue))

    cards <- lapply(seq_len(nrow(seg_stats)), function(i) {
      seg <- seg_stats$Segment[i]
      col <- SEGMENT_COLORS[[seg]]
      card(
        class = "segment-card",
        card_header(
          style = sprintf("background:%s;", col),
          icon(SEGMENT_ICONS[[seg]] %||% "circle", class = "me-2"),
          seg,
          span(class = "float-end", sprintf("#%d", i))
        ),
        card_body(
          p(class = "mb-1",
            strong(scales::comma(seg_stats$Customers[i])), " customers  \u00b7  ",
            strong(scales::dollar(seg_stats$Revenue[i])), " revenue"),
          div(class = "progress-track",
              div(class = "progress-fill",
                  style = sprintf("width:%s%%; background:%s;", seg_stats$Share[i], col))),
          p(class = "small text-muted mt-1 mb-2", sprintf("%s%% of total revenue", seg_stats$Share[i])),
          hr(),
          p(class = "mb-0 small", icon("bullseye", class = "me-1"), SEGMENT_ACTIONS[[seg]])
        )
      )
    })
    do.call(layout_columns, c(cards, list(col_widths = 4)))
  })

  # -------------------- Download full results ---------------------------------
  output$download_results <- downloadHandler(
    filename = function() paste0("rfm_analysis_results_", Sys.Date(), ".xlsx"),
    content = function(file) {
      d <- rfm_data(); req(d)

      seg_stats <- d %>%
        group_by(Segment) %>%
        summarise(
          Customer_Count   = n(),
          Avg_Recency      = round(mean(Recency), 2),
          Avg_Frequency    = round(mean(Frequency), 2),
          Avg_Monetary     = round(mean(Monetary), 2),
          Total_Revenue    = round(sum(Monetary), 2),
          Avg_Satisfaction = round(mean(satisfaction_score, na.rm = TRUE), 2),
          .groups = "drop"
        ) %>%
        mutate(Revenue_Share_pct = round(Total_Revenue / sum(Total_Revenue) * 100, 1)) %>%
        arrange(desc(Total_Revenue))

      wb <- createWorkbook()
      addWorksheet(wb, "RFM_Scores");     writeData(wb, "RFM_Scores", d)
      addWorksheet(wb, "Segment_Summary"); writeData(wb, "Segment_Summary", seg_stats)

      for (seg in unique(d$Segment)) {
        sheet_name <- substr(seg, 1, 31)
        top10 <- d %>% filter(Segment == seg) %>% arrange(desc(Monetary)) %>% head(10)
        addWorksheet(wb, sheet_name)
        writeData(wb, sheet_name, top10)
      }
      saveWorkbook(wb, file, overwrite = TRUE)
    }
  )
}

shinyApp(ui, server)

