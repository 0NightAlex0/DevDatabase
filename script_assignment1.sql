-- Table: project

-- DROP TABLE project;

CREATE TABLE project
(
  p_id character(3) NOT NULL,
  p_budget integer,
  p_total_hours integer,
  building_name character(20),
  CONSTRAINT project_pkey PRIMARY KEY (p_id),
  CONSTRAINT project_building_name_fkey FOREIGN KEY (building_name)
      REFERENCES headquarters (building_name) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE project
  OWNER TO postgres;
