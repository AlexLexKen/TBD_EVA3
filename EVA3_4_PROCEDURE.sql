/*CURSORES */
/*inout permite recibir y mandar datos con el procedimiento*/
DELIMITER //
create procedure listaCorreos(inout correos varchar(5000))
begin
	/*El declare se pone al principio del programa*/
	/*Los handler y cursores son puestos al final de la declración de variables */
	declare correo varchar(50);
	declare terminar int default false;
	/*cursor es un tipo de datos*/
	declare lista_clientes cursor for
		select email from customer limit 100;
	declare continue handler for NOT FOUND set terminar = true;

    open lista_clientes;
    obten_correos: loop
		fetch lista_clientes into correo;
        if terminar then
			leave obten_correos;
		end if;
        set correos = concat(correo, "; " ,correos);
    end loop obten_correos;
end//
DELIMITER ;