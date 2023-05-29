package med.voll.api.infra.security;

// Clase TokenGenerationException
public class TokenGenerationException extends RuntimeException {
    public TokenGenerationException(String message, Throwable cause) {
        super(message, cause);
    }
}
