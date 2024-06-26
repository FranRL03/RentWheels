import { Component, Input, OnInit, TemplateRef } from '@angular/core';
import { AlquilerService } from '../../services/alquiler.service';
import { Alquiler } from '../../models/list-alquileres';
import { AlquilerDetails } from '../../models/detalles-alquiler';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { FileService } from '../../services/file.service';

@Component({
  selector: 'app-table-alquiler',
  templateUrl: './table-alquiler.component.html',
  styleUrl: './table-alquiler.component.css'
})
export class TableAlquilerComponent implements OnInit {
  alquilerList!: Alquiler[];
  alquilerDetails!: AlquilerDetails;

  @Input() statusRent!: boolean;

  totalAlquileres = 0;
  alquileresPorPagina = 10;
  pagina = 0;

  constructor(private service: AlquilerService, private modalService: NgbModal, private fileService: FileService) { }

  ngOnInit(): void {
    this.loadPage();
  }

  loadPage(): void {
    if (this.statusRent == true || this.statusRent == false) {
        this.service.listaAlquileresActivosExpirados(this.pagina - 1, this.statusRent).subscribe(resp => {
          this.alquilerList = resp.content;
          this.alquileresPorPagina = resp.pageable.pageSize;
          this.totalAlquileres = resp.totalElements;
        });
    } else {
      this.service.listaTodosAlquileres(this.pagina - 1).subscribe(resp => {
        this.alquilerList = resp.content;
        this.alquileresPorPagina = resp.pageable.pageSize;
        this.totalAlquileres = resp.totalElements;
      });
    }
  }

  details(id: string, content: TemplateRef<any>) {
    this.service.details(id).subscribe( resp => {
      this.alquilerDetails = resp;
      console.log(this.alquilerDetails)
      this.loadModalImage(this.alquilerDetails);
    });

    this.modalService.open(content, { backdropClass: 'light-blue-backdrop' });
  }

  loadModalImage(alquilerDetails: AlquilerDetails): void {
    if (alquilerDetails && alquilerDetails.vehiculo.imagen) {
      this.fileService.getFile(alquilerDetails.vehiculo.imagen).subscribe((blob: Blob) => {
        const objectUrl = URL.createObjectURL(blob);
        alquilerDetails.vehiculo.imagen = objectUrl;
      });
    }
  }

  open(content2: TemplateRef<any>) {
		this.modalService.open(content2, { size: 'lg' });
	}
}
