import { Injectable } from '@angular/core';
import { Http, Response } from '@angular/http';
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

  request(options): Observable<Response> {
    let response = this.http.get(options.endpoint, {
      search: options.params
    });

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
    return this.request({
      endpoint: ENDPOINTS.LOGIN,
      params: options.params
    });
  }

}
