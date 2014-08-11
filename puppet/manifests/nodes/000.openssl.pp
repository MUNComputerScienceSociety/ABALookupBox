$location = "St. Johns"
$country = "CA"
$state = "NL"
$organization = "MUN Computer Science Society"
$unit = "ABALookup"
$commonname = "abalookup.dev"
$keyname = "abalookup_dev"

$subject = "/C=${country}/ST=${state}/L=${location}/O=${organization}/OU=${unit}/CN=${commonname}"
$createcertificate = "/usr/bin/openssl req -new -newkey rsa:2048 -x509 -days 365 -nodes -out ${keyname}.crt -keyout ${keyname}.key -subj \"${subject}\""

exec { "openssl-csr":
  command => $createcertificate,
  cwd => '/home/vagrant',
  creates => "/home/vagrant/${keyname}.key"
}