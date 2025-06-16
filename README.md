# users_chats

Una aplicación Flutter que muestra una lista de usuarios y permite iniciar un chat con cada uno. El proyecto está estructurado siguiendo buenas prácticas de arquitectura Flutter y utiliza **Provider** para la gestión de estado y **GoRouter** para la navegación.

---

## 📦 Estructura del proyecto

```
users_chats/
├── lib/
│   ├── models/         # Modelos de datos (User, Chat, etc.)
│   ├── providers/      # Providers para gestión de estado
│   ├── screens/        # Pantallas principales de la app
│   ├── widgets/        # Widgets reutilizables
│   └── main.dart       # Punto de entrada de la app
```
---

## 🔧 Tecnologías utilizadas

- [Flutter](https://flutter.dev)
- [Provider](https://pub.dev/packages/provider)
- [GoRouter](https://pub.dev/packages/go_router)

---

## 🧠 Arquitectura

La app está organizada en capas para separar la lógica de negocio, la gestión de estado y la presentación. Utiliza **Provider** para manejar el estado global y **GoRouter** para la navegación entre pantallas.

---

## 🚀 Cómo correr el proyecto

1. Clona el repositorio:

   ```bash
   git clone https://github.com/Moisesmp75/users_chats.git
   cd users_chats
   ```

2. Instala las dependencias:

   ```bash
   flutter pub get
   ```

3. Ejecuta en emulador o dispositivo:

   ```bash
   flutter run
   ```

---

## 🗂️ Archivos importantes

- `lib/screens/home_screen.dart`: Pantalla principal con la lista de usuarios.
- `lib/screens/user_detail.dart`: Pantalla de detalle y chat con el usuario.
- `lib/providers/`: Providers para usuarios y chats.
- `test/`: Pruebas unitarias y de widgets.

---