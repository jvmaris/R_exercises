text_v <- scan("data/text/melville.txt", what = "character", sep = "\n") 
start_v <- which(text_v == "CHAPTER 1. Loomings.")
novel_lines_v <- text_v[start_v:length(text_v)]
novel_v <- paste(novel_lines_v, collapse = " ")
novel_lower_v <- tolower(novel_v) 
moby_words_l <- strsplit(novel_lower_v,"\\W") 
moby_word_v <- unlist(moby_words_l) 
not_blanks_v <- which(moby_word_v != "") 
moby_word_v <- moby_word_v[not_blanks_v]
moby_freqs_t <- table(moby_word_v)
sorted_moby_freqs_t <- sort(moby_freqs_t, decreasing = TRUE)
sorted_moby_freqs_t["he"]
sorted_moby_freqs_t["she"]
sorted_moby_freqs_t["him"]
sorted_moby_freqs_t["her"]
sorted_moby_freqs_t
moby_length_v <- sum(sorted_moby_freqs_t)
sorted_moby_rel_freqs_t <- 100*(sorted_moby_freqs_t/moby_length_v)
sorted_moby_rel_freqs_t["the"]
plot(
  sorted_moby_rel_freqs_t[1:10], type = "b",
  xlab = "Top Ten Words in Moby Dick",
  ylab = "Percentage of Full Text",
  xaxt = "n"
  ) 
axis(
  1, 1:10,
  labels = names(sorted_moby_rel_freqs_t [1:10])
  )
