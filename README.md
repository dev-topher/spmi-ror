# Examen Técnico

Mi entorno de prueba posee las siguientes características:

* Linux Mint 21 Cinnamon

* Ruby 3.1.1p18 (2022-02-18 revision 53f5fc4236) [x86_64-linux]

* Rails 7.0.5

* psql (PostgreSQL) 14.7 (Ubuntu 14.7-0ubuntu0.22.04.1)

* Redis 4.8

## Gemas

* gem "bootstrap", "~> 5.2"
* gem "jquery-rails", "~> 4.5"
* gem "popper_js", "~> 2.11"
* gem "figaro" , "~> 1.2"
* gem "devise", "~> 4.9"
* gem "chartkick", "~> 5.0.2"
* gem "groupdate", "~> 6.2.1"
* gem "pagy", "~> 6.0.4"

## Instalación

Lo primero es descargar el proyecto con el entorno previamente mencionado o similar

Lo siguiente es ejecutar un:

```bash
bundle install
```

en la terminal al estar puesto en la carpeta del proyecto para que instale o actualice todas las gemas con las versiones especificadas.

--------------------------------------------------------------------------------

También es necesario generar el archivo de entorno con la gema Figaro, la cual, utiliza el siguiente comando en terminal:

```bash
bundle exec figaro install
```

el cual crea un archivo "application.yml" en donde se deben introducir las siguientes variables de entorno para el correcto funcionamiento:

| Key                    | Value                                                |
| :--------------------- | :--------------------------------------------------- |
| `db_development`       | Nombre de la base de datos de desarrollo             |
| `db_production`        | Nombre de la base de datos de producción             |
| `db_test`              | Nombre de la base de datos de testing                |
| `db_usuario`           | Usuario con acceso a la base de datos                |
| `db_pw`                | Contraseña del usuario para la base de datos         |


Un ejemplo de cómo debería verse un valor es:

```yml
db_development: spmi_development
db_production: spmi_production
```

Una vez realizado estos pasos puedes usar:

```bash
rails db:create
rails db:migrate
rails db:seed
rails s
```

para crear la base de datos, insertar un usuario base estudiante y administrativo e inicializar el proyecto y probarlo en la url base (http://127.0.0.1:300).

## Changelog

* 21/09/23 - Creación de proyecto. Creación de base de datos simple. Población de datos dummy (para uso comercial debe ser requerida la información de los estudiantes y administrativos asociados a la universidad, para más información, contactarme)

* 22/09/23 - Vista pre login - Vista login - Vista registro - Vista recuperar contraseña

* 23/09/23 - 

### TO-DO:

* Vista información estudiante
* Lógica de validación de estudiante
+ Dashboard administrativo