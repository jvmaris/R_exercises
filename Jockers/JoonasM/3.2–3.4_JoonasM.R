text.v <- scan("~/Desktop/Dokumentit/2.0/TextAnalysisWithR/TAWR2/data/text/austen.txt", what="character", sep="\n")
start.v <- which(text.v == "CHAPTER 1")
end.v <- which(text.v == "THE END")
novel.lines.v <- text.v[start.v:end.v]
novel.v <- paste(novel.lines.v, collapse = " ")
novel.lower.v <- tolower(novel.v)
sense.words.l <- strsplit(novel.lower.v, "\\W")
sense.word.v <- unlist(sense.words.l)
not.blanks.v <- which(sense.word.v!="")
sense.word.v <- sense.word.v[not.blanks.v]
sense.freqs.t <- table(sense.word.v)
sorted.sense.freqs.t <- sort(sense.freqs.t, decreasing=T)
sorted.sense.rel.freqs.t <- 100*(sorted.sense.freqs.t/sum(sorted.sense.freqs.t))
plot(sorted.sense.rel.freqs.t[1:10], main="Sense and Sensibility", type="b", xlab="Top Ten Words", ylab="Percentage", xaxt="n")
axis(1,1:10, labels=names(sorted.moby.rel.freqs.t[1:10]))
unique(c(names(sorted.moby.rel.freqs.t[1:10]), names(sorted.sense.rel.freqs.t[1:10])))
names(sorted.sense.rel.freqs.t[which(names(sorted.sense.rel.freqs.t[1:10])%in%names(sorted.moby.rel.freqs.t[1:10]))])
presentSense <- which(names(sorted.sense.rel.freqs.t[1:10])%in%names(sorted.moby.rel.freqs.t[1:10]))
names(sorted.sense.rel.freqs.t[1:10]) [-presentSense]
presentMoby <- which(names(sorted.moby.rel.freqs.t[1:10])%in%names(sorted.sense.rel.freqs.t[1:10]))
names(sorted.moby.rel.freqs.t[1:10]) [-presentMoby]