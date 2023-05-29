package med.voll.api.domain.direccion;


import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Embeddable
@Getter
//lombok (le decimos que no cree los contrurtuctores)
@NoArgsConstructor
// (crea el constructor para los atributos de la clase)
@AllArgsConstructor

public class Direccion {
    //2 Incluye esta direccion a medicos

    private String calle;
    private String numero;
    private String complemento;
    private String distrito;
    private String cuidad;

    public Direccion(DatosDireccion direccion) {
        this.calle = direccion.calle();
        this.numero = direccion.numero();
        this.complemento = direccion.complemento();
        this.distrito = direccion.distrito();
        this.cuidad = direccion.cuidad();
    }

// Metod Put
    public Direccion actualizarDatos(DatosDireccion direccion) {
        this.calle = direccion.calle();
        this.numero = direccion.numero();
        this.complemento = direccion.complemento();
        this.distrito = direccion.distrito();
        this.cuidad = direccion.cuidad();
        return this;
    }

}
