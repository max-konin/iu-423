fn = function(a)
{
		for(i in 1:100)
		{
			if (a > 0 & a < masprob[i])
			{
				return (i)
			}
			if (a >= masprob[i] & a < masprob[i + 1])
				return (i)
		}
}
masprob <- double (100)
masval <- integer (10000)
mas30 <- integer (30)
mas300 <- integer (300)
masprob[1]<-0.2
for (i in 2:100){
	masprob[i]<-(masprob[i - 1] + 0.8/99)
}
for (i in 1:10000){
	masval[i] <- fn(runif(1, 0, 1))
}
for (i in 1:300)
{
	mas300[i] <- masval[sample(1:10000, 1)]
}
i <- 0
while (i <= 30)
{
	k <- 0
	a <- masval[sample(1:10000, 1)]
	for (j in 1:30)
	{
		if (a == mas30[j])
		{
			k <- 1
		}
	}
	if(k == 0){
		mas30[i] <- a
		i <- i + 1
	}
}

Mx <- 0
j <- 0
for(j in 2:100)
{
	Mx <- Mx + (j * (0.88/99)) 
}
cat("M(x)_discr = ", Mx)
Dx <- 0
Mx2 <- 0
j <- 0
for(j in 2:100)
{
	Mx2 <- Mx2 + ((j * j) * (0.88/99)) 
}
 
Dx <- Mx2 - (Mx * Mx)
cat("\nD(x)_discr = ", Dx, "\n")

cat ("\nM(x) from 30 = ", mean(mas30))
cat ("\nD(x) from 30 = ", var(mas30),"\n")

cat ("\nM(x) from 300 = ", mean(mas300))
cat ("\nD(x) from 300 = ", var(mas300),"\n")

par (mfrow = c(1,2))
hist(mas300, type = "1",breaks = 100)
#hist(mas300, breaks = 100)
#hist(masval, breaks = 100)
hist(masval, type = "2",breaks = 100)
