CREATE TABLE "entrenadores" (
	"id_entrenador" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
	"nombre" VARCHAR2(100),
	"apellido" VARCHAR2(100),
	"especialidad" VARCHAR2(100),
	PRIMARY KEY("id_entrenador")
);


CREATE TABLE "alumnos" (
	"id_alumno" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
	"nombre" VARCHAR2(100),
	"apellido" VARCHAR2(100),
	"correo" VARCHAR2(100),
	"telefono" VARCHAR2(100),
	PRIMARY KEY("id_alumno")
);


CREATE TABLE "canchas" (
	"id_cancha" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
	"nombre" VARCHAR2(100),
	"superficie" VARCHAR2(100),
	PRIMARY KEY("id_cancha")
);


CREATE TABLE "inscripciones" (
	"id_inscripcion" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
	"fecha_incripcion" DATE,
	"estado" BOOLEAN,
	"id_alumno" INTEGER,
	"id_clase" INTEGER,
	PRIMARY KEY("id_inscripcion")
);


CREATE TABLE "clases" (
	"id_clase" INTEGER NOT NULL GENERATED ALWAYS AS IDENTITY,
	"fecha" DATE,
	"hora_inicio" TIMESTAMP,
	"hora_termino" TIMESTAMP,
	"nivel" INTEGER,
	"cupo_maximo" INTEGER,
	"id_entrenador" INTEGER,
	"id_cancha" INTEGER,
	PRIMARY KEY("id_clase")
);


ALTER TABLE "entrenadores"
ADD CONSTRAINT "fk_entrenadores_id_entrenador_clases" FOREIGN KEY ("id_entrenador") REFERENCES "clases" ("id_entrenador");
ALTER TABLE "canchas"
ADD CONSTRAINT "fk_canchas_id_cancha_clases" FOREIGN KEY ("id_cancha") REFERENCES "clases" ("id_cancha");
ALTER TABLE "clases"
ADD CONSTRAINT "fk_clases_id_clase_inscripciones" FOREIGN KEY ("id_clase") REFERENCES "inscripciones" ("id_clase");
ALTER TABLE "alumnos"
ADD CONSTRAINT "fk_alumnos_id_alumno_inscripciones" FOREIGN KEY ("id_alumno") REFERENCES "inscripciones" ("id_alumno");