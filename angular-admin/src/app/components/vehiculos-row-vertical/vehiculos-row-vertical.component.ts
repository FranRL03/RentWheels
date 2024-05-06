import { Component, EventEmitter, OnInit, Output, PipeTransform, TemplateRef } from '@angular/core';
import { Transmision, Vehiculo } from '../../models/list-vehiculo.interface';
import { FormControl, ReactiveFormsModule } from '@angular/forms';
import { AsyncPipe, DecimalPipe } from '@angular/common';
import { map, startWith, take } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { VehiculoService } from '../../services/vehiculo.service';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-vehiculos-row-vertical',
  templateUrl: './vehiculos-row-vertical.component.html',
  styleUrl: './vehiculos-row-vertical.component.css',
})
export class VehiculosRowVerticalComponent implements OnInit {

  vehiculoList!: Vehiculo[];
  selectedVehiculoId!: string

  totalVehiculos = 0; 
  vehiculosPorPagina = 10;
  pagina = 0;
  id!: string;

  constructor(private service: VehiculoService, private router: Router, private modalService: NgbModal) {}

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    this.service.listVehiculos(this.pagina - 1).subscribe(resp => {
      this.vehiculoList = resp.content;
      this.vehiculosPorPagina = resp.pageable.pageSize;
      this.totalVehiculos = resp.totalElements;
    });
  }
  
  edit(id: string){
    this.router.navigate([`admin/vehiculo/form-edit/${id}`])
    console.log(id);
  }

  delete(id: string) {
    this.service.delete(id).subscribe();
    window.location.href = `http://localhost:4200/admin/coche`;
  }

	openVerticallyCentered(content: TemplateRef<any>, id: string) {
    this.selectedVehiculoId = id;
		this.modalService.open(content, { centered: true });
	}
}



