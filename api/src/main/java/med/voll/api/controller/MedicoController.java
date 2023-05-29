package med.voll.api.controller;


import jakarta.validation.Valid;
import med.voll.api.domain.direccion.DatosDireccion;
import med.voll.api.domain.medicos.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import java.net.URI;


@RestController
@RequestMapping("/medicos")
public class MedicoController {
    //@Autowired no es recomendable en el testing
    @Autowired
    private MedicoRepository medicoRepository;

    @PostMapping
    //@Valid DatosRegistroMedico valida la record DatosRegistroMedico que contine DatosDireccion direccion
    public ResponseEntity<DatosRespuestaMedico> registrarMedicos(@RequestBody @Valid DatosRegistroMedico datosRegistroMedico, UriComponentsBuilder uriComponentsBuilder) {
        // System.out.println("Medico registrado");
        //  System.out.println("El medico registrado es " + datosRegistroMedico );
        Medico medico = medicoRepository.save(new Medico(datosRegistroMedico));
        // Return 201 cread
        //get http://localhost:6060/medicos/id
        DatosRespuestaMedico datosRespuestaMedico = new DatosRespuestaMedico(medico.getId(), medico.getNombre(), medico.getEmail(),
                medico.getTelefono(), medico.getEspecialidad().toString(),
                new DatosDireccion(medico.getDireccion().getCalle(), medico.getDireccion().getDistrito(),
                        medico.getDireccion().getCuidad(), medico.getDireccion().getNumero(),
                        medico.getDireccion().getComplemento()));
//url dinamicamente
        URI url = uriComponentsBuilder.path("/medicos/{id}").buildAndExpand(medico.getId()).toUri();
        return ResponseEntity.created(url).body(datosRespuestaMedico);

    }
// findAll recuperar todos los registros de una tabla o colección de una base de datos.

    // Aqui retornamos una lista
//    public List<DatosListadoMedico> ListadoMedicos() {
//        return medicoRepository.findAll().stream().map(DatosListadoMedico::new).toList();
//    }
    @GetMapping
// Aqui retonamos una paginacion
//@PageableDefault(size = 2) elegimos cuanto se muesta aunque tiene vamor por defecto que es 20 , pero la
//mayor jeraquiar la tiene el cliente http://localhost:6060/medicos?size=1&page=1&sort=documento
    public ResponseEntity<Page<DatosListadoMedico>> ListadoMedicos(Pageable paginacion) {
        //return medicoRepository.findAll(paginacion).map(DatosListadoMedico::new);
        return ResponseEntity.ok(medicoRepository.findByActivoTrue(paginacion).map(DatosListadoMedico::new));
    }


// @GetMapping por id
// public Page<DatosListadoMedico> ListadoMedicos(@RequestParam("id") Long id, Pageable paginacion) {
//     Page<Medico> medicoPage = medicoRepository.findAll(paginacion);
//     List<DatosListadoMedico> listadoMedicos = medicoPage.stream()
//             .filter(medico -> medico.getId().equals(id))
//             .map(DatosListadoMedico::new)
//             .collect(Collectors.toList());
//
//     return new PageImpl<>(listadoMedicos, paginacion, listadoMedicos.size());
// }


    @PutMapping
    @Transactional
    public ResponseEntity actualizarMedicos(@RequestBody @Valid DatosActualizarMedicos datosActualizarMedicos) {
        Medico medico = medicoRepository.getReferenceById(datosActualizarMedicos.id());
        medico.actualizarDatos(datosActualizarMedicos);
        return ResponseEntity.ok(new DatosRespuestaMedico(medico.getId(), medico.getNombre(), medico.getEmail(), medico.getTelefono(),
                medico.getEspecialidad().toString(), new DatosDireccion(medico.getDireccion().getCalle(), medico.getDireccion().getDistrito(),
                medico.getDireccion().getCuidad(), medico.getDireccion().getNumero(), medico.getDireccion().getComplemento()

        )));
    }


    // Delete Logico
    @DeleteMapping("/{id}")
    @Transactional
    public ResponseEntity EliminarMedicos(@PathVariable Long id) {
        Medico medico = medicoRepository.getReferenceById(id);
        medico.desactivarMedico();

        return ResponseEntity.noContent().build();
    }


    //Delete base de datos
// @PathVariable signigica que viene de los parametros del body del cliente {id}
//    public void EliminarMedicos (@PathVariable Long id){
//        Medico medico = medicoRepository.getReferenceById(id);
//        medicoRepository.delete(medico);
//    }


    // corriendo el error 405 por

    @GetMapping("/{id}")
    public ResponseEntity<DatosRespuestaMedico> retornaDatosMedico(@PathVariable Long id) {
        Medico medico = medicoRepository.getReferenceById(id);
        var datosMedico = new DatosRespuestaMedico(medico.getId(), medico.getNombre(), medico.getEmail(),
                medico.getTelefono(), medico.getEspecialidad().toString(),
                new DatosDireccion(medico.getDireccion().getCalle(), medico.getDireccion().getDistrito(),
                        medico.getDireccion().getCuidad(), medico.getDireccion().getNumero(),
                        medico.getDireccion().getComplemento()));
        return ResponseEntity.ok(datosMedico);
    }


}