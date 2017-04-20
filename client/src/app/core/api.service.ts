import { Injectable } from '@angular/core';
import {Http, RequestMethod, RequestOptionsArgs, Response, Headers} from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/map';

import * as ENDPOINTS from './api-endpoint';
import { SpinnerService } from './spinner/spinner.service';

@Injectable()
export class ApiService {

  constructor(
    private http: Http,
    private spinnerService: SpinnerService
  ) { }

  private getHeaders(headers?: Headers): Headers {
    headers = headers || new Headers();
    let authtoken = localStorage.getItem('authtoken');

    if (authtoken) {
      headers.append('Authorization', authtoken);
    }

    return headers;
  }

  private getRequestOptions(options): RequestOptionsArgs {
    let requestOptions: RequestOptionsArgs = {};
    ['method', 'params', 'body'].forEach(option => {
      if (options.hasOwnProperty(option)) {
        requestOptions[option] = options[option];
      }
    });
    requestOptions.method = requestOptions.method ||
      RequestMethod.Get;

    return requestOptions;
  }

  request(endpoint, options): Observable<Response> {
    let requestOptions: RequestOptionsArgs = this.getRequestOptions(options);
    requestOptions.headers = this.getHeaders(options.headers);
    let response = this.http.request(endpoint, requestOptions);

    if (options.useSpinner) {
      this.spinnerService.activate();
      response = response.map(response => {
        this.spinnerService.deactivate();
        return response;
      });
    }

    return response;
  }

  login(options): Observable<Response> {
    let headers = new Headers({ 'Content-Type': 'application/json'});
    let requestOptions: RequestOptionsArgs = {
      method: RequestMethod.Post,
      headers: headers,
      body: JSON.stringify(options.params)
    };
    return this.request(ENDPOINTS.LOGIN, requestOptions);
  }

  bindNumber(options): Observable<Response> {
    let headers = new Headers({ 'Content-Type': 'application/json'});
    let requestOptions: RequestOptionsArgs = {
      method: RequestMethod.Post,
      headers: headers,
      body: JSON.stringify(options.params)
    };
    let endpoint = ENDPOINTS.BIND_NUMBER.replace(
      '{username}', options.params.username
    );
    return this.request(endpoint, requestOptions);
  }

  getMatches(options?: any): Observable<Response> {
    let requestParams = {
      page: options.page || 1,
      per_page: options.per_page
    };
    let requestOptions: RequestOptionsArgs = {
      method: RequestMethod.Get,
      params: requestParams
    };
    return this.request(ENDPOINTS.MATCHES, requestOptions);
  }

  getUsers(options?: any): Observable<Response> {
    let requestParams = {
      page: options.page || 1,
      per_page: options.per_page
    };
    let requestOptions: RequestOptionsArgs = {
      method: RequestMethod.Get,
      params: requestParams
    };
    return this.request(ENDPOINTS.USERS, requestOptions);
  }
}
