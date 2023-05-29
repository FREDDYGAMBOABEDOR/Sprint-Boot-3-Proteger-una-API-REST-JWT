package med.voll.api.domain.medicos;


// Datos a mostar por reglas del negocio
// @JsonIgnore se puede usar esta anotacion
//  Recibo Long id
public record DatosListadoMedico(Long id,String nombre, String especialidad, String documento, String email) {
// Aca lo muestro medico.getId(),
    public DatosListadoMedico(Medico medico){
        this (medico.getId(), medico.getNombre(), medico.getEspecialidad().toString(), medico.getDocumento(), medico.getEmail());
    }

}
