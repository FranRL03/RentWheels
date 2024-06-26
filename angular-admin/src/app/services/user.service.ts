import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { LoginResponse } from '../models/login.interface';
import { environment } from '../environment/environment';
import { UserDetailsResponse } from '../models/user-details';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  login(username: string, password: string): Observable<LoginResponse>{
    return this.http.post<LoginResponse>(`${environment.apiBaseUrl}/auth/login`,
    {
      username: username,
      password: password
    },
    {
      headers: {
        'Content-Type': 'application/json',        
      }
    }
    )
  }

  getUserDetails(): Observable<UserDetailsResponse> {
    return this.http.get<UserDetailsResponse>(`${environment.apiBaseUrl}/profile`, {
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('token')}`
      }
    })
  }
    
}
