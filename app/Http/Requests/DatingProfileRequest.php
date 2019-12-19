<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use \App\DatingProfile;
//use Auth;

class DatingProfileRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return ['bio' => 'required'];
    }

     /**
     * Custom message for validation
     *
     * @return array
     */
    public function messages()
    {
        /*
        return [
            'bio.required' => 'Bio is required',
            'state.required' => 'State is required',
            'city.required' => 'City name is required',
            'postalcode.required' => 'Postal Code is required',
            'gender.required' => 'Gender is required',
            'seeking_gender.requred' => 'Gender you are searching for is required',
        ];
        */
    }
}
