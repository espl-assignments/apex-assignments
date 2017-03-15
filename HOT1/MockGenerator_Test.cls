global class MockGenerator_Test implements HttpCalloutMock{
	global httpResponse respond(HTTPrequest req){
		System.assertEquals('https://www.googleapis.com/customsearch/v1?key=AIzaSyBv0GA3M6ZfJb93zgXP7JgVTrzPN3PsrWY&cx=007490645771623033590:pplo6fdba6y&q=test', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
		HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setStatusCode(405);
        res.setStatus('Method Not Allowed');
        return res;
	}
}