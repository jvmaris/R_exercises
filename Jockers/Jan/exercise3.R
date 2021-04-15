# Chapter 3
# 3.1 Accessing word data

sorted.moby.freqs.t["he"]
sorted.moby.freqs.t["she"]
sorted.moby.freqs.t["his"]
sorted.moby.freqs.t["her"]

sorted.moby.freqs.t[1]
sorted.moby.freqs.t["the"]

sorted.moby.freqs.t["he"]/sorted.moby.freqs.t["she"] # proportion he/she
sorted.moby.freqs.t["him"]/sorted.moby.freqs.t["her"]

# Jockers ecrit ensuite qu'il est plus interessant de comparer 2 oeuvres, Melville/Austen par exemple
# Il propose de comparer les frequences relatives des pronoms dans chaque oeuvre, ce qui semble foireux
# au vue de l'expansion infinie des textes

# Pour generer les frequences relatives, il faut diviser les freq de chaque forme par la longueur du text

length(moby.words.v)
sum(sorted.moby.freqs.t)


# 3.2 Recycling

sorted.moby.rel.freqs.t <- 100*(sorted.moby.freqs.t/sum(sorted.moby.freqs.t))
# on calcule la frequence et on multiplit par 100 pour rendre le resultat plus lisible. On a donc la frequence moyenne sur 100 mots.

num.vector.v <- c(1,2,3,4,5)
num.vector.v * 10

sorted.moby.rel.freqs.t["the"] # freq moyenne de "the" pour 100 mots
sorted.moby.rel.freqs.t["ahab"]
sorted.moby.rel.freqs.t["whale"]
sorted.moby.rel.freqs.t["ship"]

rel.freqs.plot.v <- c(sorted.moby.rel.freqs.t[1:100]) # a tester aussi avec [1:10]
plot(rel.freqs.plot.v) # pareto is with us
# graph des freq relative


plot(sorted.moby.rel.freqs.t[1:10], type="b", xlab = "Top Ten Words", ylab = "Percentage of Full Text", xaxt="n")
axis(1,1:10, labels = names(sorted.moby.rel.freqs.t [1:10]))
# graph des freq relative, mais en reliant les points, en nommant les axes et en affichant les formes dont les frequences relatives sont representes

# ----- Practice ------

# 3.1 Top Ten Words in Sense and Sensibility
# ==========================================

# Il faut commencer par pre-process le texte de la meme maniere que Moby Dick


text.austen.v <- scan("data/plainText/austen.txt", what="character", sep="\n")
# on peut utiliser 'scan', cad la  commande pour charger un texte, sur internet.
text.austen.v
start.austen.v <- which(text.austen.v == "SENSE AND SENSIBILITY")
end.austen.v <- which(text.austen.v == "THE END") # c'est potentiellement foireux. Si il y a une autre phrase qui finit en "orphan."?
start.austen.v #donne la ligne a laquelle se trouver "CHAPTER 1…" --> c'est un 'which' en somme
end.austen.v
length(text.austen.v)
start.metadata.austen.v <- text.austen.v[1:start.austen.v -1] # prendre les lignes de la premieres du fichier a l'avant derniere avant le debut du text
end.metadata.austen.v <- text.austen.v[(end.austen.v+1):length(text.austen.v)] # prend le lignes de la fin du texte a la fin du fichier
metadata.austen.v <- c(start.metadata.austen.v, end.metadata.austen.v) # combine le deux precedentes
# On aurait pu faire ces trois elements en une seule ligne de code
# metadata.v <- c(text.v[1:(start.v-1)], text.v[(end.v+1):length(text.v)])
novel.austen.lines.v <- text.austen.v[start.austen.v:end.austen.v]
text.austen.v[start.austen.v]
text.austen.v[start.austen.v-1]
text.austen.v[end.austen.v]
text.austen.v[end.austen.v+1]
length(text.austen.v)
length(novel.austen.lines.v)
length(text.austen.v) - length(novel.austen.lines.v)
novel.austen.v <- paste(novel.austen.lines.v, collapse=" " ) # paste permet de coller des choses separees (les lignes), en les espacant par la valeur de l'argument "collapse"
length(novel.austen.v)
novel.austen.v[1]
novel.austen.lower.v <- tolower(novel.austen.v) # tout mettre en lowercase
austen.words.l <- strsplit(novel.austen.lower.v, "\\W") #prends 2 arguments et produit une liste
class(novel.austen.lower.v) #class permet de verifier le type de donnees d'un objet
class(austen.words.l)
str(austen.words.l) # plus d'infos sur la structure de la donnees
austen.words.v <- unlist(austen.words.l) #remettre sous forme de vecteur
not.blanks.austen.v <- which(austen.words.v!="")
not.blanks.austen.v
austen.words.v <- austen.words.v[not.blanks.austen.v]
austen.words.v
austen.words.v[99986] # --> fonctionne
austen.words.v[4:6]
mypositions.v <- c(4,5,6)
austen.words.v[mypositions.v]
austen.words.v[c(4,5,6)]
which(austen.words.v=="love") # Trouver toutes les occurrences de l'amour
austen.words.v[which(austen.words.v=="love")]
length(austen.words.v[which(austen.words.v=="love")]) #cb d'occurrence de "love"
length(austen.words.v) # longueur du texte
# Put a count of the occurrences of love into whale.hits.v
love.hits.v <- length(austen.words.v[which(austen.words.v=="love")])
# Put a count of total words into total.words.v
total.words.austen.v <- length(austen.words.v)
# now divide
love.hits.v/total.words.austen.v
## [1] 0.0053516
length(unique(austen.words.v)) #nombre de formes
# table de contingence, forme/frequence
austen.freqs.t <- table(austen.words.v)
austen.freqs.t[1:10]
sorted.austen.freqs.t <- sort(austen.freqs.t, decreasing=TRUE) #table ordonnee par frequence decroissante
sorted.austen.freqs.t #afficher le tableau
sorted.austen.freqs.t["the"]
numstestplot.austen.v <- c(sorted.austen.freqs.t[1:10])
plot(numstestplot.austen.v)
numsallplot.austen.v <- c(sorted.austen.freqs.t[1:120773])
numssomeplot.austen.v <- c(sorted.austen.freqs.t[1:100000])
plot(numssomeplot.austen.v)
?plot
plot(numsallplot.v, type = "c")

sorted.austen.freqs.t["he"]
sorted.austen.freqs.t["she"]
sorted.austen.freqs.t["his"]
sorted.austen.freqs.t["her"]
sorted.austen.freqs.t[1]
sorted.austen.freqs.t["to"]
sorted.austen.freqs.t["he"]/sorted.austen.freqs.t["she"] # proportion he/she
sorted.austen.freqs.t["him"]/sorted.austen.freqs.t["her"]
# Pour generer les frequences relatives, il faut diviser les freq de chaque forme par la longueur du text
length(austen.words.v)
sum(sorted.austen.freqs.t)
sorted.austen.rel.freqs.t <- 100*(sorted.austen.freqs.t/sum(sorted.austen.freqs.t))
# on calcule la frequence et on multiplit par 100 pour rendre le resultat plus lisible. On a donc la frequence moyenne sur 100 mots.
sorted.austen.rel.freqs.t["the"] # freq moyenne de "the" pour 100 mots
sorted.austen.rel.freqs.t["house"]
sorted.austen.rel.freqs.t["road"]
sorted.austen.rel.freqs.t["sky"]
rel.freqs.plot.austen.v <- c(sorted.austen.rel.freqs.t[1:100]) # a tester aussi avec [1:10]
plot(rel.freqs.plot.austen.v) # pareto is with us
# graph des freq relative
plot(sorted.austen.rel.freqs.t[1:10], type="b", xlab = "Top Ten Words", ylab = "Percentage of Full Text", xaxt="n")
axis(1,1:10, labels = names(sorted.austen.rel.freqs.t [1:10]))
# graph des freq relative, mais en reliant les points, en nommant les axes et en affichant les formes dont les frequences relatives sont representes
# ---------------------------------------------

# 3.2

topten.austenmoby.t <- c(sorted.austen.freqs.t[1:10], sorted.moby.freqs.t[1:10])
unique(names(topten.austenmoby.l), incomparables = FALSE)

# 3.3

?which
"the" %in% names(sorted.moby.freqs.t[1:10])
names(sorted.austen.freqs.t[1:10]) %in% names(sorted.moby.freqs.t[1:10])

which(names(sorted.austen.freqs.t[1:10]) %in% names(sorted.moby.freqs.t[1:10]))
which(names(sorted.austen.freqs.t[1:10]) %in% names(sorted.moby.freqs.t[1:10]), arr.ind=FALSE, useNames = TRUE)
?which

#Soluce
names(sorted.austen.freqs.t[
  which(names(sorted.austen.freqs.t[1:10])
        %in% names(sorted.moby.freqs.t[1:10]))])


# 3.4

!names(sorted.austen.freqs.t[1:10]) %in% names(sorted.moby.freqs.t[1:10])

# Soluce
presentAusten <- which(names(sorted.austen.freqs.t[1:10])
                      %in% names(sorted.moby.freqs.t[1:10]))
names(sorted.austen.freqs.t[1:10])[-presentAusten]
## [1] "her" "was"
presentMoby <- which(names(sorted.moby.freqs.t[1:10])
                     %in% names(sorted.austen.freqs.t[1:10]))
names(sorted.moby.freqs.t[1:10])[-presentMoby]
## [1] "that" "his"


 
