import { Component, OnInit } from '@angular/core';
import { UserService } from '../../services/user.service';
import { Router } from '@angular/router';
import { HttpErrorResponse, HttpStatusCode } from '@angular/common/http';

@Component({
  selector: 'app-login-page',
  templateUrl: './login-page.component.html',
  styleUrl: './login-page.component.css'
})
export class LoginPageComponent implements OnInit{

  username = '';
  password = '';
  rol: string[] = [];
  id = '';

  noAuth = false;
  errorLogin = false;

  constructor(private userService: UserService, private router: Router) {}

  ngOnInit(): void {
      localStorage.clear();

      let token = localStorage.getItem('token');

      if (token != null) {
        this.router.navigateByUrl('/login')
      }
  }

  login() {
    this.validacion();
    this.userService.login(this.username, this.password).subscribe(resp => {
      localStorage.setItem('account_id', resp.id)
      localStorage.setItem('token', resp.token)
      this.rol = resp.roles;
      this.id = resp.id;

      console.log(this.id);
      console.log(this.rol);

      if (this.rol.includes('ADMIN')) {
        this.router.navigateByUrl('admin/coche')
      } else {  
        this.noAuth = true;
      }
    })
  }

  validacion() {
    if(this.username == '' || HttpStatusCode.Unauthorized || this.password == '' || HttpStatusCode.Unauthorized){
      this.errorLogin = true;
    }
  }

}
