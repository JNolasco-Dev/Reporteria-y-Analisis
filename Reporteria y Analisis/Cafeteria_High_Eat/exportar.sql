-- 1. Configuración del formato de salida
SET COLSEP ','
SET HEADSEP OFF
SET PAGESIZE 0
SET TRIMSPOOL ON
SET LINESIZE 1000
SET FEEDBACK OFF

-- 2. Iniciar la grabación en tu ruta específica
SPOOL "Direccion de donde se guardará el archivo\ventas_cafeteria.csv"

-- 3. Imprimir la fila de encabezados
SELECT 'ID_VENTA,FECHA_VENTA,HORA_VENTA,CATEGORIA,NOMBRE_PRODUCTO,PRECIO,TIPO_PAGO,CANTIDAD,TOTAL,ESTADO' FROM DUAL;

-- 4. Extraer los datos de la vista concatenados por comas
SELECT 
    ID_VENTA || ',' || 
    TO_CHAR(FECHA_VENTA, 'YYYY-MM-DD') || ',' || 
    HORA_VENTA || ',' || 
    CATEGORIA || ',' || 
    NOMBRE_PRODUCTO || ',' || 
    PRECIO_UNITARIO || ',' || 
    TIPO_PAGO || ',' || 
    CANTIDAD || ',' || 
    TOTAL_VENTA || ',' || 
    ESTADO_ORDEN
FROM VW_CAFETERIA_DATOS_PLANOS;

-- 5. Detener la grabación y restaurar la consola
SPOOL OFF
SET FEEDBACK ON