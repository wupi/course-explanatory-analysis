#demention reduction

#data sample, no pattern
set.seed(12345)
par(mar = rep(0.2, 4))
df <- matrix(rnorm(400), nrow = 40)

image(1:10, 1:40, t(df)[ , nrow(df):1] )
heatmap(df)

#data sample, pattern added.
set.seed(678910)
for ( i in 1:40) {
  coinflip <- rbinom(1, size = 1, prob = .5)
  if (coinflip) {
    df[i, ] <- df[i,] + rep(c(0,3), each = 5)
  }
}

par(mfrow = c(1,3))
hh <- hclust(dist(df))
dforder <- df[hh$order, ]
image( t(dforder)[ , nrow(dforder):1] )
plot(rowMeans(dforder), 40:1, ,pch = 19)
plot(colMeans(dforder), pch = 19)

##svd
svd1 <- svd(scale(dforder))
image(t(dforder)[, nrow(dforder):1])
plot(svd1$u[,1], 40:1, , xlab = "Row", ylab = "First left singular vector")
plot(svd1$v[,1], xlab = "Column", ylab = "First right singular vector", pch = 19)