import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListModelosNoPage } from '../models/list-modelos-no-page.interface';
import { environment } from '../environment/environment';
import { ListModelos } from '../models/list-modelos-paginacion.interface';
import { ModeloDetails } from '../models/new-modelo.interface';
import { ListVehiculo } from '../models/list-vehiculo.interface';
import { EditModeloDto } from '../dto/edit-modelo-dto';

@Injectable({
  providedIn: 'root'
})
export class ModeloService {

  constructor(private http: HttpClient) { }

  listModelosWithOutPage(): Observable<ListModelosNoPage[]> {
    return this.http.get<ListModelosNoPage[]>(`${environment.apiBaseUrl}/admin/modelo/no-page`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
  }

  listModelos(page: number): Observable<ListModelos> {
    return this.http.get<ListModelos>(`${environment.apiBaseUrl}/admin/modelo?page=${page}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
  }

  create(logo: string, modelo: string): Observable<ModeloDetails> {
    return this.http.post<ModeloDetails>(`${environment.apiBaseUrl}/admin/add/modelo`,
      {
        logo: logo,
        modelo: modelo
      }, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    });
  }

  editModelo(modeloEditado: EditModeloDto, file: File, id: string): Observable<any> {
    const formData: FormData = new FormData();
    formData.append('modeloEditado', new Blob([JSON.stringify(modeloEditado)], { type: 'application/json' }));
    formData.append('file', file);

    const headers = new HttpHeaders({
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    });

    return this.http.put(`${environment.apiBaseUrl}/admin/edit/modelo/${id}`, formData, {headers});
  }

  vehiculosModelo(id: string, page: number): Observable<ListVehiculo> {
    return this.http.get<ListVehiculo>(`${environment.apiBaseUrl}/admin/modelo/vehiculo/${id}?page=${page}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      }
    )
  }

  modeloDetails(id: string): Observable<ModeloDetails> {
    return this.http.get<ModeloDetails>(`${environment.apiBaseUrl}/admin/modelo/${id}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      }
    )
  }

  clear(id: string) {
    return this.http.delete(`${environment.apiBaseUrl}/admin/clear/modelo/${id}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
  }

  delete(id: string) {
    return this.http.delete(`${environment.apiBaseUrl}/admin/delete/modelo/${id}`,
    {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    });
  }
}
