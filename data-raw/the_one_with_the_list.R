direcao <- friends %>%
  separate(col = direcao,
           into = c("diretor1", "diretor2"),
           sep = "\\,") %>%
  select(episodio, starts_with("diretor")) %>%
  pivot_longer(cols = starts_with("diretor"),
               names_to = "diretor_num",
               values_to = "diretor_nome")



roteiro <- friends %>%
  separate(col = roteiro,
           into = c("roteirista1", "roteirista2", "roteirista3", "roteirista4"),
           sep = "\\,") %>%
  select(episodio, starts_with("roteirista")) %>%
  pivot_longer(cols = starts_with("roteirista"),
               names_to = "roteirista_num",
               values_to = "roteirista_nome")



