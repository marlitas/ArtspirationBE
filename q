
[1mFrom:[0m /mnt/c/rails_code/ArtspirationBE/lib/modules/tokenable.rb:10 Tokenable#artsy_token:

     [1;34m4[0m: [32mdef[0m [1;34martsy_token[0m
     [1;34m5[0m:   client_id = [1;36mENV[0m[[31m[1;31m'[0m[31mclient_id[1;31m'[0m[31m[0m]
     [1;34m6[0m:   client_secret = [1;36mENV[0m[[31m[1;31m'[0m[31mclient_secret[1;31m'[0m[31m[0m]
     [1;34m7[0m:   [32mif[0m [1;34;4mRails[0m.cache.fetch([31m[1;31m'[0m[31mtoken[1;31m'[0m[31m[0m) == [1;36mnil[0m
     [1;34m8[0m:     api_url = [1;34;4mURI[0m.parse([31m[1;31m'[0m[31mhttps://api.artsy.net/api/tokens/xapp_token[1;31m'[0m[31m[0m)
     [1;34m9[0m:     response = [1;34;4mNet[0m::[1;34;4mHTTP[0m.post_form(api_url, [35mclient_id[0m: client_id, [35mclient_secret[0m: client_secret)
 => [1;34m10[0m:     binding.pry
    [1;34m11[0m:     [1;34;4mRails[0m.cache.write([31m[1;31m'[0m[31mtoken[1;31m'[0m[31m[0m, [1;34;4mJSON[0m.parse(response.body)[[31m[1;31m'[0m[31mtoken[1;31m'[0m[31m[0m], [35mexpires_in[0m: [1;34m3[0m.days)
    [1;34m12[0m:   [32mend[0m
    [1;34m13[0m:   xapp_token = [1;34;4mRails[0m.cache.fetch([31m[1;31m'[0m[31mtoken[1;31m'[0m[31m[0m)
    [1;34m14[0m: [32mend[0m

