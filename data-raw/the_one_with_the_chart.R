# LEITURA

friends <- readr::read_rds("data/friends.rds")


# PALETA DE CORES

paleta10 <- criar_paleta("imagens/05-friends-livingroom.jpg", 10)
paleta15 <- criar_paleta("imagens/05-friends-livingroom.jpg", 15)
paleta29 <- criar_paleta("imagens/05-friends-livingroom.jpg", 29)
paleta81 <- criar_paleta("imagens/05-friends-livingroom.jpg", 81)


# AUDIENCIA TODOS OS EPISODIOS

audiencia_line <- friends %>%
  ggplot(aes(x = episodio, y = qntd_telespectadores_eua_milhoes)) +
  labs(x = "Episódios", y = "Audiência nos EUA (milhoes)") +
  geom_line()

audiencia_line <- audiencia_line + theme_friends()

ggsave("docs/audiencia_line.png")


audiencia_col <- friends %>%
  mutate(temporada = as.factor(temporada)) %>%
  ggplot(aes(x = episodio, width = 0.7,
             y = qntd_telespectadores_eua_milhoes, fill = temporada)) +
  geom_col() +
  labs(x = "Episódios", y = "Audiência nos EUA (milhoes)", fill = "Temporada") +
  coord_cartesian(ylim = c(0,50))

audiencia_coluna <- audiencia_col + theme_friends()

ggsave("docs/audiencia_coluna.png")


# NUMERO DE EPISODIOS POR TEMPORADA

epi_season <- friends %>%
  ggplot() +
  geom_bar(aes(x = temporada),
           color = "black", fill = paleta10) +
  labs(x = "Temporada", y = "Número de episódios") +
  coord_cartesian(ylim = c(15, 28)) +
  scale_x_continuous(limits = c(0, 11), breaks = seq(1, 10, 1))

numero_episodios_por_temporada <- epi_season + theme_friends3()

ggsave("docs/numero_episodios_por_temporada.png")


# TEMPO TOTAL (EM MINUTOS) DE EXIBICAO POR TEMPORADA

tempo_season <- friends %>%
  group_by(temporada) %>%
  summarise(duracao_min = sum(duracao_episodio_minutos)) %>%
  ggplot() +
  geom_col(aes(x = temporada, y = duracao_min),
           color = "black", fill = paleta10) +
  labs(x = "Temporada", y = "Duraçao (min)") +
  coord_cartesian(ylim = c(400, 600)) +
  scale_x_continuous(limits = c(0, 11), breaks = seq(1, 10, 1))

tempo_total_min_por_temporada <- tempo_season + theme_friends3()

ggsave("docs/tempo_total_min_por_temporada.png")

# MEDIA DE ESTRELAS (IMDB) RECEBIDAS POR TEMPORADA

stars_imdb_season <- friends %>%
  group_by(temporada) %>%
  summarise(stars_season = mean(estrelas_imdb)) %>%
  ggplot() +
  geom_col(aes(x = temporada, y = stars_season),
           color = "black", fill = paleta10) +
  labs(x = "Temporada", y = "Estrelas (IMDB)") +
  coord_cartesian(ylim = c(8, 8.8)) +
  scale_x_continuous(limits = c(0, 11), breaks = seq(1, 10, 1))

media_estrelas_imdb_por_temporada <- stars_imdb_season + theme_friends3()

ggsave("docs/media_estrelas_imdb_por_temporada.png")

# DISTRIBUICAO DE TODAS ESTRELAS (IMDB)

stars_histogram <- friends %>%
  ggplot() +
  geom_histogram(aes(x = estrelas_imdb), bins = 15,
                 color = "black", fill = paleta15) +
  labs(x = "Estrelas (IMDB)", y = NULL) +
  coord_cartesian(xlim = c(7,10)) +
  scale_x_continuous(limits = c(7, 10), breaks = seq(6, 12, .5))

histogram_estrelas <- stars_histogram + theme_friends3()

ggsave("docs/histogram_estrelas.png")


stars_hist <- hist(friends$estrelas_imdb,
                   main = "Distribuição de estrelas (IMDB) para todos os episódios",
                   ylab = "Frequência",
                   xlab = "Estrelas", xlim = c(7,10))


# TOP 10 EPISODIOS DE ACORDO COM AS ESTRELAS (IMDB)

top10_stars <- friends %>%
  arrange(desc(estrelas_imdb)) %>%
  slice_head(n = 10) %>%
  ggplot() +
  geom_col(aes(x = estrelas_imdb,
               y = reorder(titulo, +estrelas_imdb, na.rm = TRUE)),
           color = "black", fill = paleta10) +
  labs(x = "Estrelas (IMDB)", y = "Episodios") +
  coord_cartesian(xlim = c(9, 9.7)) +
  scale_x_continuous(breaks = seq(9, 10, .2))

top10_episodios_estrelas <- top10_stars + theme_friends4()

ggsave("docs/top10_episodios_estrelas.png")


# TOP 10 EPISODIOS COM MAIS TELESPECTADORES

top10_views <- friends %>%
  arrange(desc(qntd_telespectadores_eua_milhoes)) %>%
  slice_head(n = 10) %>%
  ggplot() +
  geom_col(aes(x = qntd_telespectadores_eua_milhoes,
               y = reorder(titulo, +qntd_telespectadores_eua_milhoes,
                           na.rm = TRUE)), width = 0.8,
           color = "black", fill = paleta10) +
  labs(x = "Audiência nos EUA (milhoes)", y = "Episodio") +
  coord_cartesian(xlim = c(20, 55)) +
  scale_x_continuous(breaks = seq(20, 55, 5))

top10_episodios_telespectadores <- top10_views + theme_friends4()

ggsave("docs/top10_episodios_telespectadores.png")


# DIRETORES

diretores <- direcao %>%
  na.omit() %>%
  ggplot() +
  geom_bar(aes(y = diretor_nome), color = "black",
           fill = paleta29) +
  labs(y = "Diretores", x = "Numero de episodios") +
  coord_cartesian(xlim = c(0, 50)) +
  scale_x_continuous(breaks = seq(0, 50, 10))

numero_episodios_por_diretor_horizontal <- diretores + theme_friends4()

ggsave("docs/numero_episodios_por_diretor_horizontal.png")


diretores2 <- direcao %>%
  na.omit() %>%
  ggplot() +
  geom_bar(aes(x = diretor_nome), color = "black",
           fill = paleta29) +
  labs(x = "Diretores", y = "Numero de episodios") +
  coord_cartesian(ylim = c(0, 50)) +
  scale_y_continuous(breaks = seq(0, 50, 10))

numero_episodios_por_diretor_vertical <- diretores2 + theme_friends5()

ggsave("docs/numero_episodios_por_diretor_vertical.png")


# TOP 10 DIRETORES QUE MAIS TRABALHARAM

top10_diretores <- direcao %>%
  count(diretor_nome) %>%
  na.omit() %>%
  arrange(desc(diretor_nome)) %>%
  slice_head(n = 10) %>%
  ggplot(aes(x = reorder(diretor_nome, -n), y = n, na.rm = TRUE)) +
  geom_bar(stat = "identity", color = "black", fill = paleta10) +
  labs(x = "Diretor", y = "Numero de episodios") +
  coord_cartesian(ylim = c(0, 7)) +
  scale_y_continuous(breaks = seq(0, 7, 1))

top10_diretores_por_episodio_vertical <- top10_diretores + theme_friends5()

ggsave("docs/top10_diretores_por_episodio_vertical.png")


top10_diretores2 <- direcao %>%
  count(diretor_nome) %>%
  na.omit() %>%
  arrange(desc(diretor_nome)) %>%
  slice_head(n = 10) %>%
  ggplot(aes(y = reorder(diretor_nome, +n), x = n, na.rm = TRUE)) +
  geom_bar(stat = "identity", color = "black", fill = paleta10) +
  labs(y = "Diretor", x = "Numero de episodios") +
  coord_cartesian(xlim = c(0, 7)) +
  scale_x_continuous(breaks = seq(0, 8, 1))

top10_diretores_por_episodio_horizontal <- top10_diretores2 + theme_friends4()

ggsave("docs/top10_diretores_por_episodio_horizontal.png")

# ROTEIRISTAS

roteiristas <- roteiro %>%
  na.omit() %>%
  ggplot() +
  geom_bar(aes(x = roteirista_nome), color = "black",
           fill = paleta81) +
  labs(x = "Roteirista", y = "Numero de episodios") +
  coord_cartesian(ylim = c(0, 30)) +
  scale_y_continuous(breaks = seq(0, 30, 5))

numero_episodios_por_roteirista_vertical <- roteiristas + theme_friends5()

ggsave("docs/numero_episodios_por_roteirista_vertical.png")


roteiristas2 <- roteiro %>%
  na.omit() %>%
  ggplot() +
  geom_bar(aes(y = roteirista_nome), color = "black",
           fill = paleta81) +
  labs(y = "Roteirista", x = "Numero de episodios") +
  coord_cartesian(xlim = c(0, 25)) +
  scale_x_continuous(breaks = seq(0, 25, 5))

numero_episodios_por_roteirista_horizontal <- roteiristas2 + theme_friends4()

ggsave("docs/numero_episodios_por_roteirista_horizontal.png")

# TOP 10 ROTEIRISTAS QUE MAIS TRABALHARAM

top10_roteiristas <- roteiro %>%
  count(roteirista_nome) %>%
  arrange(desc(roteirista_nome)) %>%
  slice_head(n = 10) %>%
  ggplot(aes(x = reorder(roteirista_nome, -n), y = n, na.rm = TRUE)) +
  geom_bar(stat = "identity", color = "black", fill = paleta10) +
  labs(x = "Roteirista", y = "Numero de episodios") +
  coord_cartesian(ylim = c(0, 20)) +
  scale_y_continuous(breaks = seq(0, 20, 5))

top10_roteiristas_por_episodio_vertical <- top10_roteiristas + theme_friends5()

ggsave("docs/top10_roteiristas_por_episodio_vertical.png")

top10_roteiristas2 <- roteiro %>%
  count(roteirista_nome) %>%
  arrange(desc(roteirista_nome)) %>%
  slice_head(n = 10) %>%
  ggplot(aes(y = reorder(roteirista_nome, +n), x = n, na.rm = TRUE)) +
  geom_bar(stat = "identity", color = "black", fill = paleta10) +
  labs(x = "Roteirista", y = "Numero de episodios") +
  coord_cartesian(xlim = c(0, 20)) +
  scale_x_continuous(breaks = seq(0, 20, 5))

top10_roteiristas_por_episodio_horizontal <- top10_roteiristas2 + theme_friends4()

ggsave("docs/top10_roteiristas_por_episodio_horizontal.png")

