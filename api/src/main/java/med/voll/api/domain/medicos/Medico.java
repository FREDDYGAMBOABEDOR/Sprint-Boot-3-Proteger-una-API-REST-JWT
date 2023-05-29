package med.voll.api.domain.medicos;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import med.voll.api.domain.direccion.Direccion;

// Clase envia datos
// persintencia
//nombre de la tabla
@Table(name = "medicos")
//hace referencia a la clase
@Entity(name = "Medico")
// Lombok facilita los getter
@Getter
//lombok (le decimos que no cree los contrurtuctores)
@NoArgsConstructor
// (crea el constructor para los atributos de la clase)
@AllArgsConstructor
//
@EqualsAndHashCode(of = "id")
public class Medico {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String nombre;
    private String email;

    private String telefono;
    private String documento;
    //flag
    private Boolean activo;
    @Enumerated(EnumType.STRING)
    private Especialidad especialidad;
    //1 con la clase direccion
    @Embedded
    private Direccion direccion;

    public Medico(DatosRegistroMedico datosRegistroMedico) {
        this.activo= true;
        this.nombre = datosRegistroMedico.nombre();
        this.email = datosRegistroMedico.email();
        this.telefono = datosRegistroMedico.telefono();
        this.documento = datosRegistroMedico.documento();
        this.especialidad = datosRegistroMedico.especialidad();
        this.direccion = new Direccion(datosRegistroMedico.direccion());

    }
// Metodo Put
    //Igualendo a los resulrados que llegan del dto  this.nombre = datosActualizarMedicos.nombre();
    public void actualizarDatos(DatosActualizarMedicos datosActualizarMedicos) {
        if (datosActualizarMedicos.nombre() !=null) {
            this.nombre = datosActualizarMedicos.nombre();
        }

        if (datosActualizarMedicos.direccion() != null){
            this.documento = datosActualizarMedicos.documento();
        }


        if (datosActualizarMedicos.direccion() != null){
            this.direccion = direccion.actualizarDatos(datosActualizarMedicos.direccion());
        }

    }

    public void desactivarMedico() {
        this.activo = false;
    }
}
