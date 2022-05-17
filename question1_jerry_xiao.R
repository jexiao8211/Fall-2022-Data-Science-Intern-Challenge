# Question 1 --------
data = read.csv("challengedata.csv")

# Quick visualization
hist(data$order_amount)

# Check for multimodality
library(LaplacesDemon)
is.unimodal(data$order_amount)


#a.
# Get mean order_amount per shop_id
shopidavgs = aggregate(data$order_amount, list(data$shop_id), FUN = mean)
print(shopidavgs)
    # shop 42 and shop 78 have significantly higher order_amount means
      # 235101.4902 and 49213.0435 respectively

# Get mean order_amount per user_id
useridavgs = aggregate(data$order_amount, list(data$user_id), FUN = mean)
print(useridavgs)
    # User 607 has the greatest average order_amount by far
      # 704000.000

# Either remove shops 42 and 78 from the average
# or remove user 607
# 
# Shop 78 always gets large orders (>25000)
# Shop 42 gets normal orders, as well as the 704000 orders
# 
# Magnitude of user 607 orders is far greater than shop 78 large orders


#b. 
# Will use the average order value, after removing user 607 from the data

#c.
clean = data[!data$user_id==607,]
newMetric = sum(clean$order_amount)/4983
cat("Value: ", newMetric)