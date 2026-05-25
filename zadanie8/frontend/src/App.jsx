import { useState } from 'react';

const API_BASE_URL = 'http://localhost:8080/auth';

async function requestJson(path, body) {
  const response = await fetch(`${API_BASE_URL}${path}`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify(body),
  });

  const contentType = response.headers.get('content-type') || '';
  const payload = contentType.includes('application/json')
    ? await response.json()
    : { message: await response.text() };

  return {
    ok: response.ok,
    status: response.status,
    payload,
  };
}

export default function App() {
  const [mode, setMode] = useState('login');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [status, setStatus] = useState('');
  const [loading, setLoading] = useState(false);
  const [userId, setUserId] = useState(null);

  const handleSubmit = async () => {
    setLoading(true);
    setStatus(mode === 'login' ? 'Logowanie...' : 'Rejestracja...');

    try {
      const result = await requestJson(mode === 'login' ? '/login' : '/register', {
        email: email,
        password,
      });

      if (!result.ok) {
        throw new Error(
          result.payload?.message ||
            (mode === 'login' ? 'Nie udało się zalogować.' : 'Nie udało się zarejestrować.'),
        );
      }

      setUserId(result.payload.userId ?? null);
      setStatus(result.payload.message || (mode === 'login' ? 'Zalogowano pomyślnie.' : 'Rejestracja zakończona pomyślnie.'));
    } catch (error) {
      setUserId(null);
      setStatus(error.message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <main>
      <h1>{mode === 'login' ? 'Logowanie' : 'Rejestracja'}</h1>
      <div>
        <label htmlFor="email">Email</label>
        <br />
        <input id="email" value={email} onChange={(event) => setEmail(event.target.value)}autoComplete="username"/>
      </div>
      <div style={{ marginTop: '8px' }}>
        <label htmlFor="password">Hasło</label>
        <br />
        <input id="password" value={password} onChange={(event) => setPassword(event.target.value)} type="password" autoComplete="current-password"/>
      </div>
      <div style={{ marginTop: '12px' }}>
        <button type="button" onClick={handleSubmit} disabled={loading} style={{ marginLeft: '8px' }}>
          {mode === 'login' ? 'Zaloguj' : 'Zarejestruj'}
        </button>
        <button
          type="button"
          onClick={() => {
            setMode(mode === 'login' ? 'register' : 'login');
            setStatus('');
            setUserId(null);
          }}
          disabled={loading}
          style={{ marginLeft: '8px' }}
        >
          {mode === 'login' ? 'Przejdź do rejestracji' : 'Przejdź do logowania'}
        </button>
      </div>
      <p>Status: {status}</p>
      {userId !== null ? <p>ID użytkownika: {userId}</p> : null}
    </main>
  );
}
