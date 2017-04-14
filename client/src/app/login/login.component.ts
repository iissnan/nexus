import { Component, OnInit } from '@angular/core';
import {ApiService} from "../core/api.service";

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

  constructor(private apiService: ApiService) {
  }

  ngOnInit() { }

  login() {
    this.apiService.login(this.model);
  }

}
