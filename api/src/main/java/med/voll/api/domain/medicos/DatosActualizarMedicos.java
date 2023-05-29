package med.voll.api.domain.medicos;

import jakarta.validation.constraints.NotNull;
import med.voll.api.domain.direccion.DatosDireccion;

//recibo datos
public record DatosActualizarMedicos(@NotNull Long id, String nombre, String documento, DatosDireccion direccion) {


}
