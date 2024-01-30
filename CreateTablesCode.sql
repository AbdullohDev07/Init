CREATE TABLE "subjects"(
    "id" bigserial NOT NULL,
    "name" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "subjects" ADD PRIMARY KEY("id");
CREATE TABLE "groups"(
    "id" bigserial NOT NULL,
    "subjectId" BIGINT NOT NULL
);
ALTER TABLE
    "groups" ADD PRIMARY KEY("id");
CREATE TABLE "students"(
    "id" bigserial NOT NULL,
    "fullname" VARCHAR(255) NOT NULL,
    "age" BIGINT NOT NULL
);
ALTER TABLE
    "students" ADD PRIMARY KEY("id");
CREATE TABLE "studentsXgroups"(
    "id" bigserial NOT NULL,
    "studentId" BIGINT NOT NULL,
    "groupId" BIGINT NOT NULL
    foreign key ("studentId") references Students(Id),
	foreign key ("groupId") references Groups(Id)
);
ALTER TABLE
    "studentsXgroups" ADD PRIMARY KEY("studentId", "groupId");
CREATE TABLE "archive_students"(
    "id" bigserial NOT NULL,
    "oldid" BIGINT NOT NULL
    "fullname" VARCHAR(255) NOT NULL,
    "age" BIGINT NOT NULL
);
ALTER TABLE
    "archive_students" ADD PRIMARY KEY("id");
ALTER TABLE
    "studentsXgroups" ADD CONSTRAINT "studentsxgroups_studentid_foreign" FOREIGN KEY("studentId") REFERENCES "students"("id");
ALTER TABLE
    "groups" ADD CONSTRAINT "groups_subjectid_foreign" FOREIGN KEY("subjectId") REFERENCES "subjects"("id");
ALTER TABLE
    "studentsXgroups" ADD CONSTRAINT "studentsxgroups_groupid_foreign" FOREIGN KEY("groupId") REFERENCES "groups"("id");