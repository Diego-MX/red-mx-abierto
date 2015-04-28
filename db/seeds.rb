Stage.create!([
  {name: "Planea | Desarrollar y publicar el Plan de Apertura", position: nil},
  {name: "Publica | Dar las características de datos abiertos", position: nil},
  {name: "Perfecciona | Avanzar en la madurez de los datos abiertos", position: nil},
  {name: "Promueve | Colaborar con los usuarios de datos", position: nil}
])
Step.create!([
  {name: "Formar un equipo de trabajo", position: nil, stage_id: 1},
  {name: "Crear un inventario general de datos", position: nil, stage_id: 1},
  {name: "Priorizar los datos de valor", position: nil, stage_id: 1},
  {name: "Preparar los conjuntos de datos", position: nil, stage_id: 2},
  {name: "Publicar los conjuntos de Datos Abiertos", position: nil, stage_id: 2},
  {name: "Documentar los conjuntos de datos", position: nil, stage_id: 2},
  {name: " Publicar el catálogo de Datos Abiertos en datos.gob.mx", position: nil, stage_id: 2},
  {name: "Administración", position: nil, stage_id: 3},
  {name: "Utilizar herramientas para usar los datos en la administración pública ", position: nil, stage_id: 4},
  {name: "Organizar eventos para la socialización de datos", position: nil, stage_id: 4}
])
Activity.create!([
  {name: "Designar un Enlace Administrativo y un Administrador/a de Datos Abiertos, enviando un oficio con ambas designaciones a la Coordinación de Estrategia Digital Nacional, siguiendo esta plantilla. La dirección es: mexico.abierto@datos.gob.mx.", position: nil, step_id: 1},
  {name: "Hacer del conocimiento general de la administración pública local la designación y tareas del Equipo de Datos Abiertos, para facilitar el mandato de la política de apertura de datos.", position: nil, step_id: 1},
  {name: "Formar y reunir al Consejo municipal, estatal, delegacional o del Distrito Federal de Datos Abiertos para coordinar la implementación de la Política en el gobierno de la localidad o de la entidad. (Sugerencia)", position: nil, step_id: 1},
  {name: "Pedir un inventario general de datos a todas las áreas responsables de generar o administrar datos. ", position: nil, step_id: 2},
  {name: "Enviar el cuestionario diagnóstico a los encargados de todas las áreas generadoras o receptoras de datos.", position: nil, step_id: 2},
  {name: "El/la Administrador/a de Datos Abiertos podrá solicitar cambios y ajustes a los inventarios de cada área responsable para ajustarse al formato necesario.", position: nil, step_id: 2},
  {name: "Consolidar información en un solo listado, siguiendo este formato.", position: nil, step_id: 2},
  {name: "Solicitar a la Unidad de Transparencia y/o a los Órganos Garantes del Derecho de Acceso a la Información estatales un reporte de las solicitudes de acceso a la información pública más recurrentes para que sean incluidas en la primera publicación.", position: nil, step_id: 3},
  {name: "Sesionar el Consejo municipal, estatal, delegacional o del Distrito Federal de Datos Abiertos para priorizar los datos del Inventario General según los objetivos del gobierno, su plan de desarrollo local y/o estatal y el Plan Nacional de Desarrollo. (Sugerencia)", position: nil, step_id: 3},
  {name: "Publicar el Plan de Apertura municipal, estatal, delegacional o del Distrito Federal con los los pasos anteriores.", position: nil, step_id: 3},
  {name: "Exportar los datos a archivos estáticos tabulares.", position: nil, step_id: 4},
  {name: "Convertir los archivos a formatos abiertos CSV.", position: nil, step_id: 4},
  {name: "Asegurar la validez del formato y estructura del archivo.", position: nil, step_id: 4},
  {name: "Habilitar los urls de los conjuntos de datos para que se hagan disponibles para descarga en datos.gob.mx.", position: nil, step_id: 5},
  {name: "Seguir la guía para documentar metadatos usando DCAT. Disponible aquí.", position: nil, step_id: 6},
  {name: "Descargar  y completar el Oficio de Designación de Enlace y Administrador/a de Datos Abiertos.", position: nil, step_id: 7},
  {name: "Enviar dicho Oficio a adela@datos.gob.mx para solicitar el acceso en ADELA  Este correo tendrá como respuesta un nombre de usuario y contraseña para acceder a la aplicación web.", position: nil, step_id: 7},
  {name: "Subir el catálogo de datos y revisar que esté reflejado correctamente en datos.gob.mx.", position: nil, step_id: 7},
  {name: "Revisar el tablero de control en ADELA.", position: nil, step_id: 8},
  {name: "Atender a las recomendaciones realizadas por el Órgano Interno de Control, usuarios y la  Coordinación de Estrategia  Digital Nacional.", position: nil, step_id: 8},
  {name: "Incorporar las peticiones de usuarios y órganos internos de control en el siguiente Plan de Acción.", position: nil, step_id: 8},
  {name: "Documentar y publicar ‘historias’ de éxito en datos.gob.mx.", position: nil, step_id: 9},
  {name: "Utilizar las secciones de herramientas y apps en datos.gob.mx, para promocionar el uso y aprovechamiento de tu catálogo de Datos Abiertos.", position: nil, step_id: 9},
  {name: "Responder a los usuarios que utilicen los canales de comunicación de datos.gob.mx y de la Red MX Abierto en mxabierto.org (por ejemplo las secciones del foro o comentarios en cada conjunto).", position: nil, step_id: 9},
  {name: "Organizar acciones de vinculación, participación y socialización de Datos Abiertos utilizando las metodologías aquí descritas.", position: nil, step_id: 10},
  {name: "Evaluar la experiencia de los participantes de las acciones de vinculación para incorporar las recomendaciones en los próximos eventos.", position: nil, step_id: 10}
])
