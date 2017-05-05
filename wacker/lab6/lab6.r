whole <- read.table("WHOLE.DAT")
names_whole <- read.table("NAME.DAT")
n <- ncol(whole)
m <- nrow(whole)
for (i in 1 : m)
{
	for(j in 1 : n)
	{
		if(whole[i, j] == "NN")
		{
			whole[i, j] = NA
		}
	}
}

for (i in 1:(n - 1)){
	cat(sprintf("%s%s%s%s", "Коэффициент корреляции для ", names_whole[i, 1], " и ", names_whole[n, 1]), "\n")
	print(cor.test(as.numeric(whole[,i]), as.numeric(whole[,n]), na.rm=TRUE))
}
