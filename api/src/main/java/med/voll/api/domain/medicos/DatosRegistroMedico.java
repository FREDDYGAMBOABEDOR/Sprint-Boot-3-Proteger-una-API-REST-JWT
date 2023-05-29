package med.voll.api.domain.medicos;


import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import med.voll.api.domain.direccion.DatosDireccion;

// Record recibe datos es un DTO
// Usamos la validacion de anotaciones @NotNull , @NotBlank
public record DatosRegistroMedico(
        @NotNull
        @NotBlank
        String nombre,
        @NotBlank
        @Email
        String email,
        @NotBlank
        String telefono,
        @NotBlank
        // validamos que el documento tenga de 4 a 6 digitos el regexp es porque la expresion es regular
        @Pattern(regexp = "\\d{4,6}")
        String documento,
        @NotNull
        Especialidad especialidad,
        @NotNull
        //2. Valid
        @Valid
        DatosDireccion direccion ) {
}
