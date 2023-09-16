# PCList
[MyPCList](https://mypclist.net) clone in Rails. Allows user to create an account, add, edit and delete their machines (PCs, laptops, etc) and browse through others' profiles and machines.

<table>
    <tr>
        <td colspan="3">
            <img src="screenshots/profile.png" alt="Profile page with a list of user's machines (desktops and laptops)">
        </td>
        <td colspan="3">
            <img src="screenshots/machine page.png" alt="Machine page - showing a title, data like release date, condition, type, etc; a photo and description">
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img src="screenshots/homepage.png" alt="">
        </td>
        <td colspan="2">
            <img src="screenshots/explore.png" alt="">
        </td>
        <td colspan="2">
            <img src="screenshots/new machine.png" alt="">
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img src="screenshots/edit profile.png" alt="">
        </td>
        <td colspan="2">
            <img src="screenshots/log in.png" alt="">
        </td>
        <td colspan="2">
            <img src="screenshots/sign up.png" alt="">
        </td>
    </tr>
</table>

## External dependencies
In order for it to work, you need to have the following external dependencies installed on your system
- `vips-tools`

## Development
0. Install Ruby, Node.js, yarn and clone this repository
1. Install dependencies
```shell
bundle install
yarn install
```
2. Run migrations and start the dev server
```shell
bin/rails db:migrate
bin/dev
```
