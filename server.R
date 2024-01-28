source("funciones.R")
# Definir el servidor
server <- function(input, output, session) {
  listas_documentos <- list(documentos_lista1,
                            documentos_lista2,
                            documentos_lista3,
                            documentos_lista4)
  
  purrr::imap(listas_documentos, ~{
    output_name <- paste0("botones_documentos", .y)
    output[[output_name]] <- renderUI({
      tagList(generar_botones(paste0("boton", .y), .x))
    })
  })
  
  
  youtube_videosA <- c("zBZCOke0MKc", "mnsCnUdNx-Y", "VIDEO_ID_3")
  
  # Renderizar el reproductor de YouTube para Video 1
  output$youtubePlayerA1 <- renderUI({
    tags$iframe(
      width = "100%", height = 315,
      src = paste0("https://www.youtube.com/embed/", youtube_videosA[1]),
      frameborder = "0", allowfullscreen = TRUE
    )
  })
  
  # Renderizar el reproductor de YouTube para Video 2
  output$youtubePlayerA2 <- renderUI({
    tags$iframe(
      width = "100%", height = 315,
      src = paste0("https://www.youtube.com/embed/", youtube_videosA[2]),
      frameborder = "0", allowfullscreen = TRUE
    )
  })
  
  # Renderizar el reproductor de YouTube para Video 3
  output$youtubePlayerA3 <- renderUI({
    tags$iframe(
      width = "100%", height = 315,
      src = paste0("https://www.youtube.com/embed/", youtube_videosA[3]),
      frameborder = "0", allowfullscreen = TRUE
    )
  })
  
  
  youtube_videosB <- c("hYPakgpVSFM", "0nJKiPRtVPo", "VIDEO_ID_3")
  
  output$youtubePlayerB1 <- renderUI({
    tags$iframe(
      width = "100%", height = 315,
      src = paste0("https://www.youtube.com/embed/", youtube_videosB[1]),
      frameborder = "0", allowfullscreen = TRUE
    )
  })
  output$youtubePlayerB2 <- renderUI({
    tags$iframe(
      width = "100%", height = 315,
      src = paste0("https://www.youtube.com/embed/", youtube_videosB[2]),
      frameborder = "0", allowfullscreen = TRUE
    )
  })
  
  youtube_videosC <- c("yG_0Wur70Zk", "0nJKiPRtVPo", "VIDEO_ID_3")
  
  output$youtubePlayerC1 <- renderUI({
    tags$iframe(
      width = "100%", height = 315,
      src = paste0("https://www.youtube.com/embed/", youtube_videosC[1]),
      frameborder = "0", allowfullscreen = TRUE
    )
  })
  
  youtube_videosD <- c("_xihdrLVZw4", "0nJKiPRtVPo", "VIDEO_ID_3")
  output$youtubePlayerD1 <- renderUI({
    tags$iframe(
      width = "100%", height = 315,
      src = paste0("https://www.youtube.com/embed/", youtube_videosD[1]),
      frameborder = "0", allowfullscreen = TRUE
    )
  })
  
  
  output$tabla_libros <- renderTable({
    datos
  })
  
  # Filtrar datos según la búsqueda
  datos_filtrados <- reactive({
    termino_busqueda <- input$termino_busqueda
    opcion_busqueda <- input$opcion_busqueda
    
    if (!is.null(termino_busqueda) && termino_busqueda != "") {
      if (opcion_busqueda == "Título") {
        filtro <- grepl(termino_busqueda, datos$Título, ignore.case = TRUE)
      } else if (opcion_busqueda == "Autor") {
        filtro <- grepl(termino_busqueda, datos$Autor, ignore.case = TRUE)
      }
      datos[filtro, ]
    } else {
      datos
    }
  })
  
  # Mostrar tabla con los datos filtrados y enlaces de descarga
  observe({
    output$tabla_libros <- renderTable({
      # Filtrar datos
      datos_filtrados_local <- datos_filtrados()
      
      # Agregar enlaces de descarga
      datos_filtrados_local$Descarga <- sprintf(
        '<a href="%s" target="_blank">Descargar</a>',
        datos_filtrados_local$Descarga
      )
      
      # Retornar la tabla resultante
      datos_filtrados_local
    }, sanitize.text.function = function(x) x)
  })
  
  
  
  
  observeEvent(input$btn_video1, {
    selectTab(session, "video1")
  })
  
  observeEvent(input$btn_video2, {
    updateTabItems(session, "drive", "video2")
  })
  
  observeEvent(input$btn_video3, {
    updateTabItems(session, "drive", "video3")
  })
  
}