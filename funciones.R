generar_botones <- function(id_prefix, documentos) {
  lapply(seq_len(nrow(documentos)), function(i) {
    boton_id <- paste0(id_prefix, "_", i)
    a(
      actionButton(
        inputId = boton_id,
        label = documentos$Documento[i],
        icon = icon("file-pdf", lib = "font-awesome"),
        width = "100%"
      ),
      href = documentos$Enlace[i], target = "_blank"
    )
  })
}

url <- "https://raw.githubusercontent.com/percygp/Grupo-de-Estudio/main/libros.csv"

# Cargar datos desde el archivo CSV en GitHub
datos <- read.csv(url)

########################
url_csv_lista <- "https://raw.githubusercontent.com/percygp/Grupo-de-Estudio/main/documentos.csv"
datos_lista <- read.csv(url_csv_lista)

# Filtrar datos para cada lista
documentos_lista1 <- datos_lista[datos_lista$Lista == 1, c("Documento", "Enlace")]
documentos_lista2 <- datos_lista[datos_lista$Lista == 2, c("Documento", "Enlace")]
documentos_lista3 <- datos_lista[datos_lista$Lista == 3, c("Documento", "Enlace")]
documentos_lista4 <- datos_lista[datos_lista$Lista == 4, c("Documento", "Enlace")]
