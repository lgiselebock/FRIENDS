theme_friends <- function() {
  theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.major = element_blank(),
          text = element_text(family = "Gabriel Weiss' Friends Font",
                              size = 10),
          legend.position = "bottom",
    )
}

# LEGENDAS INCLINADAS

theme_friends2 <- function() {
  theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major.x = element_blank(),
          panel.grid.major = element_blank(),
          text = element_text(family = "Gabriel Weiss' Friends Font",
                              size = 10),
          legend.position = "bottom",
          axis.text.x = element_text(hjust = 1.1, angle = 45))
}

# LINHAS HORIZONTAIS

theme_friends3 <- function() {
  theme_minimal() +
    theme(panel.grid.minor = element_blank(),
          panel.grid.major.x = element_blank(),
          text = element_text(family = "Gabriel Weiss' Friends Font",
                              size = 10),
          legend.position = "bottom")
}

# LINHAS VERTICAIS

theme_friends4 <- function() {
  theme_minimal() +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.major = element_blank(),
          text = element_text(family = "Gabriel Weiss' Friends Font",
                              size = 10),
          legend.position = "bottom")
}

# LINHAS HORIZONTAIS + LEGENDA INCLINADA

theme_friends5 <- function() {
  theme_minimal() +
    theme(panel.grid.major.x = element_blank(),
          panel.grid.major = element_blank(),
          text = element_text(family = "Gabriel Weiss' Friends Font",
                              size = 10),
          legend.position = "bottom",
          axis.text.x = element_text(hjust = 1.1, angle = 45))
}
