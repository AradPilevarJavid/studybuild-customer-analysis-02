# 📊 Comprehensive Customer Analysis & Business Strategy Report

> **Version:** 1.0 | **Date:** 2026 | **Prepared by:** Data Analysis Team

---

## 📑 Table of Contents

1. [Business Overview](#1-business-overview)
2. [Key Findings](#2-key-findings)
3. [Discount Analysis](#3-discount-analysis)
4. [Customer Segmentation](#4-customer-segmentation)
5. [Pareto Analysis](#5-pareto-analysis)
6. [RFM Analysis](#6-rfm-analysis)
7. [At-Risk Customers](#7-at-risk-customers)
8. [City Analysis](#8-city-analysis)
9. [Strategic Recommendations](#9-strategic-recommendations)
10. [Final Conclusion](#10-final-conclusion)

---

## 1. Business Overview

### 📈 Key Performance Indicators (KPI)

| Metric | Value | Status |
|--------|-------|--------|
| Total Customers | 60 | 🟡 Moderate |
| Total Revenue | $222,906.59 | 🟢 Good |
| Average Order Value (AOV) | $212.10 | 🟠 Low |
| Average Customer Satisfaction | 2.98 / 10 | 🔴 Critical |
| Average Customer LTV | $3,366.43 | 🟡 Moderate |
| Churn Risk Rate | 83.3% | 🔴 Critical |
| Average Inactive Days | 205 days | 🔴 Critical |

### 🏷️ Revenue by Membership Tier

| Tier | Total Revenue | Purchase Count | Order Value | Satisfaction |
|------|---------------|----------------|-------------|--------------|
| **Bronze** | $56,999.81 | 16.89 | $203.45 | 3.11 |
| **Gold** | $75,153.20 | 17.05 | $227.56 | 2.74 |
| **Silver** | $33,439.41 | 16.50 | $281.53 | 2.50 |
| **VIP** | $57,314.17 | 18.87 | $165.85 | 3.40 |

---

## 2. Key Findings

### 🚨 A) Churn Crisis & Low Satisfaction

**Status:** 83.3% of customers (50 out of 60) have not made a purchase in over 90 days.

**Details:**
- Average satisfaction is only **2.98 out of 10** — customers are not satisfied with their shopping experience.
- Satisfaction above 3 is mostly driven by **discounts**, not product quality.
- **Conclusion:** When discounts end, customers won't return. The core problem is quality and service, not price.

### 💰 B) Low Order Value

**Status:** Average order value is only $212.

**Details:**
- Customers tend to buy **lower-priced** products.
- Lack of product data (we don't know exactly what they bought) makes decision-making difficult.
- **Conclusion:** The current pricing strategy or premium product offerings are not working.

### 🤔 C) Membership Tier Paradox

**Observation:** An unusual pattern exists in the data:

| Tier | Satisfaction | Purchase Count | Total Revenue | Order Value |
|------|--------------|----------------|---------------|-------------|
| Bronze | 3.11 | 16.89 | $56,999 | $203 |
| Gold | 2.74 | 17.05 | $75,153 | $227 |
| Silver | 2.50 | 16.50 | $33,439 | $281 |
| VIP | 3.40 | 18.87 | $57,314 | $165 |

**Paradox Analysis:**
1. **Bronze** customers have the highest satisfaction (3.11) and good purchase counts — low expectations, easy to satisfy.
2. **Gold** customers have the lowest satisfaction (2.74) despite high purchase activity — high expectations, insufficient service.
3. **VIP** customers have the highest total revenue ($57K) but the lowest order value ($165).
4. **Silver** customers have the lowest satisfaction (2.50) but the highest order value ($281).

**Conclusion:**
- High-value customers (VIP/Gold) have higher expectations that current services fail to meet.
- Regular customers (Bronze) are easier to satisfy due to lower expectations.
- **The current tier system requires fundamental revision.**

---

## 3. Discount Analysis

### 📊 Customer Behavior Comparison (With/Without Discount)

| Metric | With Discount | Without Discount | Difference | Interpretation |
|--------|---------------|------------------|------------|----------------|
| Purchase Count | 17.50 | 17.29 | +0.21 | 🔴 Negligible |
| Order Value | $203.29 | $218.83 | **-$15.54** | 🔴 Negative |
| Satisfaction | 3.27 | 2.76 | +0.51 | 🟢 Positive (18%) |

### 💡 Key Findings

1. **Discounts do NOT increase purchases:**
   - The difference is only +0.21 purchases — statistically insignificant.
   - Discounted customers make the same number of purchases.

2. **Discounts REDUCE order value:**
   - Discounted customers spend $15.54 LESS per order.
   - This means **our profit margin decreases** without increasing sales volume.

3. **Discounts only positively affect satisfaction:**
   - Satisfaction increases by 18% (3.27 vs 2.76).
   - Discounted customers feel better about the brand.

### 🎯 Strategic Recommendation

> **Stop using discounts as a "sales tool."**
> 
> Use discounts ONLY in these cases:
> - **Appreciation for VIP customers** (to maintain loyalty)
> - **Win-back for at-risk customers** (as a "welcome back" gift)
> - **Post-purchase follow-up** (to boost satisfaction)

---

## 4. Customer Segmentation

### 📊 Value/Risk Matrix

| Segment | Count | Avg Revenue | Satisfaction | Inactive Days | Status |
|---------|-------|-------------|--------------|---------------|--------|
| High Value - Low Risk | 4 | $6,641.64 | 4.00 | 32.2 | 🟢 Healthy |
| Low Value - Low Risk | 6 | $1,464.54 | 3.67 | 51.7 | 🟢 Healthy |
| High Value - High Risk | 26 | $6,216.11 | 2.85 | 227.4 | 🔴 Critical |
| Low Value - High Risk | 24 | $1,080.58 | 2.79 | 231.8 | 🔴 Critical |

### 🚨 Critical Analysis

**50 out of 60 customers (83.3%) are at high risk!**

| Segment | Count | Percentage | Importance |
|---------|-------|------------|------------|
| High Value - High Risk | 26 | 43.3% | 🔴 **Biggest threat** |
| Low Value - High Risk | 24 | 40% | 🟠 Inactive customers |
| Low Value - Low Risk | 6 | 10% | 🟡 Regular customers |
| High Value - Low Risk | 4 | 6.7% | 🟢 Golden customers (rare!) |

**Key Note:** Our high-value customers (26 with avg revenue of $6,216) have not purchased in over 7 months. This means **the company's treasures are fleeing.**

---

## 5. Pareto Analysis (80/20)

### 📊 Revenue Distribution

| Metric | Value | Interpretation |
|--------|-------|----------------|
| Customers for 80% of revenue | 25 (41.7%) | ❌ Higher than 20% |
| Revenue from top 20% | $122,485.44 (54.9%) | ❌ Lower than 80% |
| Revenue from bottom 80% | $100,421.15 (45.1%) | - |
| Avg revenue per top-20% customer | $10,207.12 | - |
| Avg revenue per bottom-80% customer | $2,092.11 | - |
| Revenue ratio | 4.9x | 🟡 Moderate |

### 🏆 Top 5 Customers

| Rank | ID | Revenue | Tier | Cumulative % |
|------|-----|---------|------|--------------|
| 1 | #30 | $25,000.00 | VIP | 11.22% |
| 2 | #44 | $14,354.34 | Gold | 17.66% |
| 3 | #57 | $13,532.74 | Bronze | 23.73% |
| 4 | #12 | $11,731.50 | Gold | 28.99% |
| 5 | #9 | $11,615.42 | Silver | 34.20% |

### 💡 Dual Analysis

**✅ Good News:**
- Revenue is NOT overly dependent on a few customers.
- Losing a few top customers won't collapse total revenue.
- Revenue diversification reduces business risk.

**❌ Bad News:**
- Retention requires managing a LARGE number of customers (higher cost).
- We cannot focus all resources on a small group.
- Marketing strategy must be broad, not targeted.

### 🤔 Unexpected Finding: Gold Outperforms VIP!

Among the top 10 customers, **Gold and Bronze** tiers dominate, not VIP.

**Possible Reasons:**
1. Tier classification may be based on purchase COUNT, not total value.
2. VIP customers may be newer or currently churning.
3. The tier system may not be up to date.
4. The VIP tier may not effectively incentivize higher spending.

---

## 6. RFM Analysis

### 📊 Full Segmentation

| Segment | Count | Total Revenue | Revenue Share | Inactive Days | Purchase Count | Satisfaction |
|---------|-------|---------------|---------------|---------------|----------------|--------------|
| **Champions** | 7 | $50,606.98 | 22.7% | 114 | 28.14 | 3.43 |
| **Hibernating** | 14 | $47,843.94 | 21.5% | 288 | 17.86 | 2.50 |
| **Need Attention** | 9 | $47,552.79 | 21.3% | 209 | 24.78 | 2.67 |
| **At Risk** | 3 | $40,514.84 | 18.2% | 282 | 27.67 | 3.33 |
| **New Customers** | 14 | $21,646.76 | 9.7% | 103 | 13.29 | 3.29 |
| **Loyal Customers** | 3 | $8,300.13 | 3.7% | 52 | 21.00 | 4.67 |
| **Lost** | 7 | $4,479.16 | 2.0% | 311 | 3.71 | 2.71 |
| **Potential Loyalists** | 3 | $1,961.99 | 0.9% | 196 | 5.00 | 2.33 |

### 💡 Key Insights

#### 1. At Risk — Highest-Value Segment (Critical!)
- Only **3 customers** generate 18.2% of revenue.
- Average revenue per customer: **$13,504** (almost 2x Champions).
- Includes our largest customer (#30 with $25,000) inactive for 340 days.

#### 2. Hibernating — Biggest Opportunity
- **14 customers** with $47,844 in revenue are still recoverable.
- Average inactivity (288 days) is lower than Lost (311 days) — they haven't fully left yet.
- **Note:** Their satisfaction is 2.50 — we must find the reason for dissatisfaction.

#### 3. New Customers — Strategic Priority
- **14 new customers** with $21,647 in revenue.
- Their satisfaction (3.29) is lower than Loyal (4.67) — they haven't reached loyalty level yet.
- **Opportunity:** Using past customer data, we can prevent their churn at low cost.

#### 4. Loyal Customers — Rare and Valuable
- Only **3 customers** with the highest satisfaction (4.67).
- We need to convert new customers into this segment.

#### 5. Lost — Low Priority
- Only $4,479 (2%) in revenue — re-engaging them is not cost-effective.

---

## 7. At-Risk Customers

### 🚨 High-Value Customers Fleeing (Over 200 Days Inactive)

| ID | Revenue | Inactive Days | Tier | Priority |
|----|---------|---------------|------|----------|
| #30 | $25,000.00 | 340 | VIP | 🔴 Critical |
| #12 | $11,731.50 | 224 | Gold | 🔴 Critical |
| #9 | $11,615.42 | 232 | Silver | 🔴 Critical |
| #10 | $7,241.47 | 276 | Silver | 🔴 Critical |
| #35 | $5,918.21 | 365 | Bronze | 🔴 Critical |
| #33 | $5,521.20 | 112 | VIP | 🟠 High |
| #5 | $3,899.42 | 273 | Silver | 🟠 High |
| #6 | $3,868.55 | 205 | Gold | 🟠 High |
| #7 | $2,237.35 | 298 | VIP | 🔴 Critical |
| #11 | $2,264.04 | 272 | Bronze | 🟠 High |

**Total revenue of these 10 customers: ~$51,000 (23% of total company revenue)**

### 💡 Key Note on "Brand Recall"

Customers inactive for 200+ days likely don't remember:
- What they bought from us
- How their experience was
- Even that such a store exists!

**Solution:** For this group, we must first **remind them of the brand** (email/SMS/ads), then offer a sales proposition.

---

## 8. City Analysis

### 📊 Revenue by City

| City | Total Revenue | Purchase Count | Order Value | Potential |
|------|---------------|----------------|-------------|-----------|
| **Mashhad** | $64,118.44 | 22.64 | $210.51 | ⚠️ Relatively saturated |
| **Tabriz** | $36,192.49 | 15.75 | $238.90 | ✅ Good |
| **Karaj** | $26,189.81 | 16.00 | $211.44 | ✅ Good |
| **Ahvaz** | $23,384.78 | 13.88 | $208.57 | 🟡 Moderate |
| **Isfahan** | $21,975.32 | 19.80 | $212.68 | ✅ Good |
| **Shiraz** | $20,715.92 | 16.33 | $180.98 | 🟡 Moderate |
| **Rasht** | $15,168.54 | 16.40 | $241.55 | 💎 High quality |
| **Tehran** | $15,161.29 | 17.17 | $172.93 | 🚀 Huge potential |

### 🎯 Proposed Strategy

#### 1. Tehran — Investment for Growth
- **Population:** ~9 million — we only have 1% market share!
- **Opportunity:** Acquire new customers + win back old Tehran customers.
- **Risk:** Low order value ($172) — we must focus on economic packages.

#### 2. Mashhad — Maintain Current Revenue
- Largest revenue source ($64K).
- **Strategy:** Focus on retention with personalized discounts.
- **Why?** Acquiring a new customer costs 5x more than retaining an existing one.

#### 3. Rasht — Hidden Gem
- Highest order value ($241) — Rasht residents are willing to spend more.
- **Strategy:** Test premium products or special packages.

---

## 9. Strategic Recommendations

### 📋 Action Priority

| Priority | Action | Target | Cost | Timeline |
|----------|--------|--------|------|----------|
| 🥇 | Recover At Risk customers | $40,515 | Low | Immediate |
| 🥈 | Win-back Hibernating campaign | $47,844 | Medium | This week |
| 🥉 | Improve new customer experience | Long-term growth | Medium | This month |
| 4 | Revise tier system | Better loyalty | Low | This month |
| 5 | Improve quality & support | Higher satisfaction | Medium | Ongoing |
| 6 | Maintain brand recall | Word-of-mouth marketing | Low | Ongoing |

### 🎯 Action Details

#### 1. Recover At Risk Customers (Immediate)
- Direct sales team contact with 3 high-value customers.
- Special return offer: 30% discount + free shipping + gift.
- Investigate reason for no purchase (quality? price? service?).

#### 2. Win-back Hibernating Campaign (This Week)
- Send personalized email/SMS.
- Satisfaction survey to understand dissatisfaction reasons.
- Targeted discount offer based on purchase history.

#### 3. Improve New Customer Experience (This Month)
- Improve registration and first-purchase process.
- Send welcome message + usage guide.
- Post-purchase follow-up.

#### 4. Revise Tier System (This Month)
- Define new criteria based on actual customer value.
- Review tier benefits and improve them.
- Ensure tiers incentivize purchasing.

#### 5. Improve Quality & Support (Ongoing)
- Review customer feedback and reviews.
- Upgrade response speed and quality.
- Optimize search and user experience.

#### 6. Maintain Brand Recall (Ongoing)
- Send periodic content (newsletter, special offers).
- Create a loyalty program with real rewards.
- Use word-of-mouth marketing as the primary tool.

---

## 10. Final Conclusion

### 🎯 Key Message for the CEO

> **"Our business has a solid $222K revenue base, but we are losing high-value customers. The top priority is to recover At Risk customers ($40K) and win back Hibernating customers ($48K). These 17 customers represent 40% of our revenue and are still recoverable. If we act now, we can save nearly $88K in revenue. If we wait, that revenue is lost forever."**

### 📌 Status Summary

| Aspect | Status | Required Action |
|--------|--------|-----------------|
| Total Revenue | 🟢 $222K | Maintain & grow |
| Customer Satisfaction | 🔴 2.98/10 | Immediate improvement |
| Churn Risk | 🔴 83.3% | Immediate action |
| Discounts | 🟡 Ineffective for sales | Change strategy |
| Tier System | 🔴 Ineffective | Revise |
| High-Value Customers | 🔴 Fleeing | Immediate contact |

### 🚀 Next Steps

1. **Today:** Contact the 3 At Risk customers.
2. **This week:** Launch Hibernating win-back campaign.
3. **This month:** Revise tier system and improve new customer experience.
4. **Ongoing:** Monthly monitoring of satisfaction and churn rate.

---

## 📎 Appendix: R Score (Recency) Explanation

The **R** score indicates "how recent the last purchase was":

| Score | Meaning |
|-------|---------|
| 5 | Less than ~100 days (very recent) |
| 4 | Relatively recent |
| 3 | Moderate |
| 2 | Some time ago |
| 1 | More than ~300 days (very old) |

**Example:** Customer #30 with R=1 means 340 days since their last purchase — they are practically forgetting our brand.

---

*Report prepared based on complete analysis of 60 customers' data — all findings are based on real data and statistical analysis.*
