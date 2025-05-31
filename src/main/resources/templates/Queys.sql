CREATE TABLE Usuario_TBL(
                            USUARIO_ID INT PRIMARY KEY IDENTITY(1,1),
                            NOMBRE NVARCHAR(100) NOT NULL,
                            EMAIL NVARCHAR(50) NOT NULL,
                            PASS NVARCHAR(250) NOT NULL,
                            FECHA_REGISTRO DATETIME DEFAULT GETDATE(),
                            USE_NAME NVARCHAR(50) UNIQUE
);
GO


EXEC sp_help Usuario_TBL
EXEC sp_help Post_TBL


CREATE TABLE Post_TBL(
                         POST_ID INT PRIMARY KEY IDENTITY(1,1),
                         USUARIO_ID INT NOT NULL,
                         CONTENIDO NVARCHAR(MAX),
                         FECHA_CREACION DATETIME DEFAULT GETDATE(),
                         FOREIGN KEY (USUARIO_ID) REFERENCES Usuario_TBL(USUARIO_ID)
);

CREATE TABLE Imagenes_TBL(
                             IMAGEN_ID INT PRIMARY KEY IDENTITY(1,1),
                             POST_ID INT NOT NULL,
                             URL_IMAGEN NVARCHAR(250) NOT NULL,
                             FOREIGN KEY (POST_ID) REFERENCES Post_TBL(POST_ID)
);

CREATE TABLE Comentario_TBL(
                               COMENTARIO_ID INT PRIMARY KEY IDENTITY(1,1),
                               POST_ID INT NOT NULL,
                               USE_ID INT NOT NULL,
                               CONTENIDO NVARCHAR(280)NOT NULL,
                               FECHA_COMENT DATETIME DEFAULT GETDATE(),
                               FOREIGN KEY (USE_ID) REFERENCES Usuario_TBL(USUARIO_ID),
                               FOREIGN KEY (POST_ID) REFERENCES Post_TBL(POST_ID)
);


CREATE TABLE Reaccion_TBL(
                             REACCION_ID INT PRIMARY KEY IDENTITY(1,1),
                             POST_ID INT NOT NULL,
                             USE_ID INT NOT NULL,
                             TIPO_REACCION NVARCHAR(20) NOT NULL,
                             FECHA_REACCION DATETIME DEFAULT GETDATE(),
                             FOREIGN KEY(POST_ID) REFERENCES Post_TBL(POST_ID),
                             FOREIGN KEY(USE_ID) REFERENCES Usuario_TBL(USUARIO_ID)
);