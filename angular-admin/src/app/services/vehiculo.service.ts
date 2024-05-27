import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { ListVehiculo } from '../models/list-vehiculo.interface';
import { environment } from '../environment/environment';
import { VehiculoAllDetails } from '../models/new-vehiculo.interface';
import { VehiculoDto } from '../dto/vehiculo-dto';

@Injectable({
  providedIn: 'root'
})
export class VehiculoService {

  constructor(private http: HttpClient) { }

  listVehiculos(page: number): Observable<ListVehiculo> {
    return this.http.get<ListVehiculo>(`${environment.apiBaseUrl}/admin/vehiculos?page=${page}`,
    
    {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    })
  }

  createVehiculo(vehiculoCreate: VehiculoDto, file: File): Observable<any> {
    const formData: FormData = new FormData();
    formData.append('vehiculoCreate', new Blob([JSON.stringify(vehiculoCreate)], { type: 'application/json' }));
    formData.append('file', file);

    const headers = new HttpHeaders({
      'Authorization': `Bearer ${localStorage.getItem('token')}`
    });

    return this.http.post(`${environment.apiBaseUrl}/admin/add/vehiculo`, formData, {headers});
    }

    edit(vehiculoEditado: VehiculoDto, file: File, id: string): Observable <any> {
        const formData: FormData = new FormData();
        formData.append('vehiculoEditado', new Blob([JSON.stringify(vehiculoEditado)], { type: 'application/json' }));
        formData.append('file', file);
    
        const headers = new HttpHeaders({
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        });
    
        return this.http.put(`${environment.apiBaseUrl}/admin/edit/vehiculo/${id}`, formData, {headers});
      }

    details(id: string): Observable<VehiculoAllDetails> {
      return this.http.get<VehiculoAllDetails>(`${environment.apiBaseUrl}/admin/vehiculo-details/${id}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      })
    }

    delete(id: string) {
      return this.http.delete(`${environment.apiBaseUrl}/admin/delete/vehiculo/${id}`,
      {
        headers: {
          'Authorization': `Bearer ${localStorage.getItem('token')}`
        }
      });
    }
}
