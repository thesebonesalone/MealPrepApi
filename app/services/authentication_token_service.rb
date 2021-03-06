class AuthenticationTokenService
    HMAC_SECRET = 'my$ecretK3y'
    ALG_TYPE = "HS256"
    def self.call(user_id)
        payload = {user_id: user_id}
        return JWT.encode payload, HMAC_SECRET, ALG_TYPE
    end

    def self.recall(token)
        return JWT.decode token, HMAC_SECRET, true, {algorithm: ALG_TYPE}
    end

end