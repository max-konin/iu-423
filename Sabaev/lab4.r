	arr30 <- 1:30
	arr300 <- 1:300
	arr <- 1:1000
	MxD <- 0
	DxD <- 0
	kv <- 0
	a <- 0
	s <- 0
	Pi <- 1:100
	Pi[1] <- 0.2
	
	i <- 2	
	for (i in 2:100){
		Pi[i] <- Pi[i - 1] + 0.8/99;	
		i <- i + 1				
	}
	
	fn <- function(a){
		i <- 1
		for(i in 1:100){
			if (a > 0 & a < Pi[i]){
				return (i)}
		}
		return (0)
	}
	
	i <- 1
	
	for (i in 1:1000){
		a <-  runif(1, 0.0, 1.0)
		r <- fn(a)
		arr[i] <- r
		i <- i + 1
	}
	
	
	arr30 <- union(arr, arr)
	
	i <- 1
	for (i in 1:300){
		a <- runif(1, 0, 1000)
		arr300[i] <- arr[a]
		i <- i + 1
	}
	
	Mx30 <- 0
	Mx300 <- 0
	Dx30 <- 0
	Dx300 <- 0
	i <- 1
	s <- 0
	for (i in 1:30){
		s <- s + arr30[i]
		i <- i + 1
	}		
	Mx30 <- s / 30
	
	s <- 0
	i <- 1
	for (i in 1:300){
		s <-  s + arr300[i]
		i <- i + 1
	}
	Mx300 <- s / 300
	
	s <- 0;
	i <- 1
	for(i in 1:30){
		s <- (arr30[i] - Mx30)^2
		i <- i + 1
	}
	Dx30 <- s / 30
	
	s <- 0;
	i <- 1
	for(i in 1:300){
		s <- (arr300[i] - Mx300)^2
		i <- i + 1
	}
	Dx300 = s / 300
	
	i <- 1
	for (i in 1:100){
		kv <- i^2 * (0.8/99);
		i <- i + 1
	}
	
	i <- 1 
	for (i in 1:100){
		MxD <- i * (0.8/99)
		i <- i + 1
	}
		
	DxD <- kv - MxD^2
	
	Pi
	arr
	arr30
	arr300
	
	Mx30
	Mx300
	Dx30
	Dx300
	MxD
	DxD
