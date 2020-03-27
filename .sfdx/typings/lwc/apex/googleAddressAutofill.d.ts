declare module "@salesforce/apex/googleAddressAutofill.getSuggestions" {
  export default function getSuggestions(param: {input: any}): Promise<any>;
}
declare module "@salesforce/apex/googleAddressAutofill.getPlaceDetails" {
  export default function getPlaceDetails(param: {placeId: any}): Promise<any>;
}
declare module "@salesforce/apex/googleAddressAutofill.getAddress" {
  export default function getAddress(param: {recordId: any, street: any, city: any, state: any, country: any, zip: any}): Promise<any>;
}
