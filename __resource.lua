resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Head Phone' 		

server_script {						
	'server.lua',
	'config.lua'
}

client_script {		
	'config.lua',				
	'client.lua'
}


ui_page('html/index.html')

files {
    'html/index.html',
    'html/app.js'
}









