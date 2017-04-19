import { Component, OnInit } from '@angular/core';
import { Router } from "@angular/router";
import { ApiService } from "../core/api.service";


interface LoginModel {
  username?: string,
  password?: string
}

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  model: LoginModel = {};

  constructor(
    private router: Router,
    private apiService: ApiService
  ) { }

  ngOnInit() { }

  login() {
    this.apiService.login({ params: this.model })
      .subscribe(response => {
        if (response.ok) {
          let data = response.json();
          localStorage.setItem('authtoken', data.auth_token);
          let user = data.user;
          let path = user.sn ?
            `/users/${user.name}` :
            `/users/${user.name}/sn`;

          this.router.navigateByUrl(path);
        }
      });
    return false;
  }
}
