library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(fontawesome)
source("funciones.R")

# Definir la interfaz de usuario (UI)
ui <- dashboardPage(
  dashboardHeader(title = "Grupo de Estudio"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Inicio", tabName = "home", icon = icon("home")),
      menuItem("Documentos", tabName = "drive", icon = icon("folder")),
      menuItem("Repasos", tabName = "repaso", icon = icon("youtube")),
      menuItem("Talleres", tabName = "talleres", icon = icon("youtube")),
      menuItem("Libros", tabName = "libros", icon = icon("book"))
      #menuItem("Taller de Python", tabName = "youtube", icon = icon("youtube")#,
               #menuSubItem("Video 1", tabName = "video1"),
               #menuSubItem("Video 2", tabName = "video2"),
               #menuSubItem("Video 3", tabName = "video3")
      #)
    )
  ),
  dashboardBody(
    useShinyjs(),  # Asegurarse de cargar shinyjs
    tabItems(
      tabItem("home",
              titlePanel(tags$h1("Grupo de Estudio FCE",
                                 style = "text-align: center; font-family: 'Arial, sans-serif'; font-weight: bold;"
              )
              ),
              fluidRow(
                column(
                  width = 12,
                  box(
                    width = "100%",
                    title = "Descripción",
                    HTML("<p>El Grupo de Estudio es un espacio colaborativo en la Facultad de Economía de la Universidad Nacional
                         Mayor de San Marcos donde los estudiantes pueden fortalecer sus habilidades académicas, así como aprender y
                         enseñar a través de talleres y cursos.</p>"),
                  ),
                  box(
                    width = "100%",
                    title = "Objetivos",
                    HTML("<ul>
                          <li>Mejorar Habilidades Académicas</li>
                          <li>Fomentar el Intercambio de Conocimientos</li>
                          <li>Brindar Apoyo Mutuo</li>
                      </ul>")
                  ),
                  box(
                    width = "100%",
                    title = "Actividades",
                    HTML("<ul>
                          <li>Sesiones de grupo de estudio</li>
                          <li>Repaso para examenes parciales</li>
                          <li>Talleres en temas de lenguajes de programación</li>
                      </ul>")
                  )
                )
                
              )
      ),
      tabItem("libros",
              fluidRow(
                box(
                  width = 12, title = "Libros",
                  fluidRow(
                    column(8, textInput("termino_busqueda", "Término de Búsqueda")),
                    column(4, selectInput("opcion_busqueda", "Buscar por:", choices = c("Título", "Autor"), selected = "Título"))
                  ),
                  tableOutput("tabla_libros")
                )
              )
      ),
      tabItem("drive",
              fluidRow(
                column(
                  width = 12,
                  box(
                    width = "100%",
                    title = "Matematica para Economía I",
                    solidHeader = TRUE,
                    uiOutput("botones_documentos1")
                  ),
                  box(
                    width = "100%",
                    title = "Matematica para Economía II",
                    solidHeader = TRUE,
                    uiOutput("botones_documentos2")
                  ),
                  box(
                    width = "100%",
                    title = "Matematica para Economía III",
                    solidHeader = TRUE,
                    uiOutput("botones_documentos3")
                  ),
                  box(
                    width = "100%",
                    title = "Adicionales",
                    solidHeader = TRUE,
                    uiOutput("botones_documentos4")
                  )
                )
              )
      ),
      tabItem("repaso",
              fluidRow(
                column(
                  width = 12,
                  box(
                    width = "100%",
                    tabsetPanel(
                      id = "tabs2",

                          tabPanel("Estadística",
                            box(
                              width = "100%",
                              h3("Prueba de Hipótesis"),
                                uiOutput("youtubePlayerA1"),
                              h4("Isabel Huarcaya [31/10/2022]")
                            
                            ),
                            box(
                              width = "100%",
                              h3("Estimación de Parámetros"),
                              uiOutput("youtubePlayerA2"),
                              h4("Nathaly Melendez [01/11/2022]")
                            )
                          ),
                        tabPanel("Matemática para Economía",
                                 box(
                                   width = "100%",
                                   h3("Sistema de Ecuaciones Diferenciales Ordinarias"),
                                   uiOutput("youtubePlayerB1"),
                                   h4("Fernando Ku [01/11/2022]")
                                 ),
                                 box(
                                   width = "100%",
                                   h3("Álgebra Lineal"),
                                   uiOutput("youtubePlayerB2"),
                                   h4("Percy Guerra [31/07/2022]")
                                 )
                                 
                        )
                    )
                    )
                )
              )

      ),
      tabItem("talleres",
              fluidRow(
                column(
                  width = 12,
                  box(
                    width = "100%",
                    #title = "Taller de GAMS",
                    tabsetPanel(
                      id = "tabs",
                      tabPanel("Taller de GAMS",
                               #h3("Contenido de la Pestaña 1"),
                               box(
                                 width = "100%",
                                 h3("Repaso"),
                                 uiOutput("youtubePlayerC1"),
                                 h4("Juan Chire [12/05/2023]"),
                                 
                               )
                               ),
                      tabPanel("Taller de Python",
                               box(
                                 width = "100%",
                                 h3("Taler Python 01"),
                                 uiOutput("youtubePlayerD1"),
                                 h4("Percy Guerra [21/01/2024]"),
                               ),
                               box(
                                 width = "100%",
                                 h3("Taler Python 02"),
                                 #uiOutput("youtubePlayerD2"),
                                 h4("Pendiente"),
                               ),
                               box(
                                 width = "100%",
                                 h3("Taler Python 03"),
                                 #uiOutput("youtubePlayerD3"),
                                 h4("Pendiente"),
                               ),
                               box(
                                 width = "100%",
                                 h3("Taler Python 04"),
                                 #uiOutput("youtubePlayerD4"),
                                 h4("Pendiente"),
                               )
                               )#,
                      #tabPanel("Pestaña 3", h3("Contenido de la Pestaña 3"))
                    )
                  )
                )
              )
      ),
      tabItem("video1",
              fluidRow(
                box(
                  width = 6, title = "Taller de Python - Video 1"#,
                  #uiOutput("youtubePlayer1")
                )
              )
      ),
      tabItem("video2",
              fluidRow(
                box(
                  width = 6, title = "Taller de Python - Video 2"#,
                  #uiOutput("youtubePlayer2")
                )
              )
      ),
      tabItem("video3",
              fluidRow(
                box(
                  width = 6, title = "Taller de Python - Video 3"#,
                  #uiOutput("youtubePlayer3")
                )
              )
              
      )
    )
  )
)