setwd("/Users/saban/Documents/TextAnalysisWithR")
text.v <- scan("data/plainText/melville.txt", what="character", sep="\n")
start.v <- which(text.v == "CHAPTER 1. Loomings.")
end.v <- which(text.v == "orphan.")
novel.lines.v <- text.v[start.v:end.v]
novel.v <- paste(novel.lines.v, collapse=" ")
novel.lower.v <- tolower(novel.v)
moby.words.l <- strsplit(novel.lower.v, "\\W")
moby.word.v <- unlist(moby.words.l)
not.blanks.v <- which(moby.word.v!="")
moby.word.v <- moby.word.v[not.blanks.v]
n.time.v <- seq(1:length(moby.word.v))
queequeg.v <- which(moby.word.v == "queequeg")
queequeg.v
w.count.v <- rep(NA,length(n.time.v))
w.count.v[queequeg.v] <- 1
plot(w.count.v, main="Dispersion Plot of `queequeg' in Moby Dick",
     xlab="Novel Time", ylab="queequeg", type="h", ylim=c(0,1), yaxt='n')
rm(list = ls())
chap.positions.v <- grep("^CHAPTER \\d", novel.lines.v)
novel.lines.v <- c(novel.lines.v, "END")
last.position.v <- length(novel.lines.v)
chap.positions.v <- c(chap.positions.v , last.position.v)
chapter.raws.l <- list()
chapter.freqs.l <- list()
for(i in 1:length(chap.positions.v)){
  if(i != length(chap.positions.v)){
    chapter.title <- novel.lines.v[chap.positions.v[i]]
    start <- chap.positions.v[i]+1
    end <- chap.positions.v[i+1]-1
    chapter.lines.v <- novel.lines.v[start:end]
    chapter.words.v <- tolower(paste(chapter.lines.v, collapse=" "))
    chapter.words.l <- strsplit(chapter.words.v, "\\W")
    chapter.word.v <- unlist(chapter.words.l)
    chapter.word.v <- chapter.word.v[which(chapter.word.v!="")]
    chapter.freqs.t <- table(chapter.word.v)
    chapter.raws.l[[chapter.title]] <- chapter.freqs.t
    chapter.freqs.t.rel <- 100*(chapter.freqs.t/sum(chapter.freqs.t))
    chapter.freqs.l[[chapter.title]] <- chapter.freqs.t.rel
  }
}

#Chapter 4 exercises
whales.l <- lapply(chapter.freqs.l, '[', 'whale')
whales.m <- do.call(rbind, whales.l)
whales.v <- as.vector(whales.m[,1])
ahabs.l <- lapply(chapter.freqs.l, '[', 'ahab')
ahabs.m <- do.call(rbind, ahabs.l)
ahabs.v <- as.vector(ahabs.m[,1])
queequeg.l <- lapply(chapter.freqs.l, '[', 'queequeg')
queequeg.m <- do.call(rbind, queequeg.l)
queequeg.v <- as.vector(queequeg.m[,1])
whales.ahabs.queequeg.m <- cbind(whales.v, ahabs.v,queequeg.v)
colnames(whales.ahabs.queequeg.m) <- c("whale", "ahab", "queequeg")
barplot(whales.ahabs.queequeg.m, beside=T, col="black")

whale.raw.l <- lapply(chapter.raws.l, '[', 'whale')
whale.raw.m <- do.call(rbind, whale.raw.l)
whale.raw.v <- as.vector(whale.raw.m[,1])
ahab.raw.l <- lapply(chapter.raws.l, '[', 'ahab')
ahab.raw.m <- do.call(rbind, ahab.raw.l)
ahab.raw.v <- as.vector(ahab.raw.m[,1])
whales.ahabs.raw.m <- cbind(whale.raw.v, ahab.raw.v)
barplot(whales.ahabs.raw.m, beside=T, col="grey")

