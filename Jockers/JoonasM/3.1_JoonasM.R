text.v <- scan("~/Desktop/Dokumentit/2.0/TextAnalysisWithR/TAWR2/data/text/melville.txt", what="character", sep="\n")
start.v <- which(text.v == "CHAPTER 1. Loomings.")
end.v <- which(text.v == "orphan")
start.metadata.v <- text.v[1:start.v-1]
metadata.v <- c(start.metadata.v, end.metadata.v)
novel.lines.v <- text.v[start.v:end.v]
novel.v <- paste(novel.lines.v, collapse = " ")
novel.lower.v <- tolower(novel.v)
moby.words.l <- strsplit(novel.lower.v, "\\W")
moby.word.v <- unlist(moby.words.l)
not.blanks.v <- which(moby.word.v!="")
moby.word.v <- moby.word.v[not.blanks.v]
moby.freqs.t <- table(moby.word.v)
sorted.moby.freqs.t <- sort(moby.freqs.t, decreasing=T)
sorted.moby.rel.freqs.t <- 100*(sorted.moby.freqs.t/sum(sorted.moby.freqs.t))
plot(sorted.moby.rel.freqs.t[1:10], main="Moby Dick", type="b", xlab="Top Ten Words", ylab="Percentage", xaxt="n")
axis(1,1:10, labels=names(sorted.moby.rel.freqs.t[1:10]))
