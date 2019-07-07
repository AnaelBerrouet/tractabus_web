# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Tractabus.Repo.insert!(%Tractabus.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Tractabus.Articles.Article

#Remove articles

#Insert Articles
articles = [
  {"Albert (short story)",  2.5592054243796664e-05,  10.943768115942028,  69},
  {"Konstantin Leontiev", 3.797213085560982e-05, 13.369172932330827,  532},
  {"Al-Mawardi",  2.6982754766234355e-05,  14.128472906403939,  406},
  {"List of philosophers of language",  0.00013707962288333337,  6.224999999999998, 8},
  {"Constantin Rădulescu-Motru",  3.2303089876013355e-05,  15.47015748031496, 2540},
  {"A History of Western Philosophy", 4.834784691036881e-05, 12.37658163265306, 784},
  {"Reinhardt Grossmann", 1.7684632950041624e-05,  18.025818181818185,  110},
  {"Victor Dave", 1.5005772240449736e-05,  14.116160990712075,  323},
  {"Environmentalism",  0.0001959593910070931, 15.689216300940437,  4466},
  {"Criticism of postmodernism",  3.575379539340927e-05, 15.568447893569843,  1804},
  {"Democrates",  1.872060453405358e-05, 12.94051948051948, 154},
  {"Jane Jacobs", 2.9996727823416006e-05,  13.239812481687665,  6826},
  {"Wilhelm von Humboldt",  0.00029102236981335333,  14.062793650793651,  1890},
  {"Foundherentism",  2.7707071449903256e-05,  16.591557788944723,  398},
  {"Formalism (art)", 0.000300136466338604,  13.619908396946567,  655},
  {"Sub specie aeternitatis", 2.9138087690445343e-05,  11.122900232018562,  1724},
  {"Systematic ideology", 1.629026314676419e-05, 14.857601476014757,  1084},
  {"Robert Spaemann", 2.2804354343922277e-05,  13.786666666666665,  300},
  {"Rupert Read", 3.5438898451036816e-05,  13.345739910313895,  1784},
  {"Christian Kabbalah",  4.2574750632443195e-05,  14.786911225238445,  1363},
  {"Clemens Baeumker",  1.7360016672573746e-05,  12.621194029850745,  134},
  {"Meaning postulate", 1.48878544088192e-05,  8.195630252100841, 119},
  {"Marie de Gournay",  2.4731204911056687e-05,  11.846246933769418,  1223},
  {"Stoicism",  0.001048613712544376,  12.826818642350556,  3948},
  {"Hayom Yom", 2.049957228964532e-05, 12.964759916492692,  479}
]

articles
|> Enum.each(fn {title, pagerank, readability, word_count} ->
  Tractabus.Repo.insert!(%Article{title: title, pagerank: pagerank, readability: readability, word_count: word_count})
end)
