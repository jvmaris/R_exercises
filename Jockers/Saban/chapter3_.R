setwd("/Users/saban/Documents/TextAnalysisWithR")

#Moby Dick starts
text.v2 <- scan("data/plainText/melville.txt", what="character", sep="\n")
text.v2
start.v2 <- which(text.v2 == "CHAPTER 1. Loomings.")
end.v2 <- which(text.v2 == "orphan.")
start.v2
end.v2
length(text.v2)
start.metadata.v2 <- text.v2[1:start.v -1]
end.metadata.v2 <- text.v2[(end.v+1):length(text.v2)]
metadata.v2 <- c(start.metadata.v2, end.metadata.v2)
novel.lines.v2 <- text.v2[start.v2:end.v2]
novel.v2 <- paste(novel.lines.v2, collapse=" ")
novel.lower.v2 <- tolower(novel.v2)
moby.words.l <- strsplit(novel.lower.v2, "\\W")
moby.word.v <- unlist(moby.words.l)
not.blanks.v2 <- which(moby.word.v!="")
moby.freqs.t <- table(moby.word.v)
sorted.moby.freqs.t <- sort(moby.freqs.t , decreasing=TRUE)
sorted.moby.rel.freqs.t <- 100*(sorted.moby.freqs.t/sum(sorted.moby.freqs.t))
plot(sorted.moby.rel.freqs.t[1:10], type="b", xlab="Top Ten Words", ylab="Percentage of Full Text", xaxt ="n")
axis(1,1:10, labels=names(sorted.moby.rel.freqs.t [1:10]))

#Sense and Sensibility starts
text.v <- scan("data/plainText/austen.txt", what="character", sep="\n")
text.v
start.v <- which(text.v == "CHAPTER 1")
end.v <- which(text.v == "losing him in the course of nature.  He may live twenty years longer.")
start.v
end.v
length(text.v)
start.metadata.v <- text.v[1:start.v -1]
end.metadata.v <- text.v[(end.v+1):length(text.v)]
metadata.v <- c(start.metadata.v, end.metadata.v)
novel.lines.v <- text.v[start.v:end.v]
novel.v <- paste(novel.lines.v, collapse=" ")
novel.lower.v <- tolower(novel.v)
austen.words.l <- strsplit(novel.lower.v, "\\W")
austen.word.v <- unlist(austen.words.l)
not.blanks.v <- which(austen.word.v!="")
austen.freqs.t <- table(austen.word.v)
sorted.austen.freqs.t <- sort(austen.freqs.t , decreasing=TRUE)
sorted.austen.rel.freqs.t <- 100*(sorted.austen.freqs.t/sum(sorted.austen.freqs.t))
plot(sorted.austen.rel.freqs.t[1:10], type="b", xlab="Top Ten Words", ylab="Percentage of Full Text", xaxt ="n")
axis(1,1:10, labels=names(sorted.austen.rel.freqs.t [1:10]))

#compare
unique(c(names(sorted.moby.rel.freqs.t[1:10]), names(sorted.austen.rel.freqs.t[1:10])))
names(sorted.austen.rel.freqs.t[which(names(sorted.austen.rel.freqs.t[1:10]) %in% names(sorted.moby.rel.freqs.t[1:10]))])

      